#!/usr/bin/env bash

printf "Removing Sentry containers\n"
printf -- "--------------------------\n\n"

yes | docker-compose -f ./docker-compose.yml -f ./compose-files/sentry/docker-compose.yml \
    stop sentry sentry-cron sentry-worker 2> /dev/null
yes | docker-compose -f ./docker-compose.yml -f ./compose-files/sentry/docker-compose.yml \
    rm sentry sentry-cron sentry-worker 2> /dev/null

# temp key in docker-compose for dev
#printf -- "--------------------------\n\n"
#printf "Generating Sentry secret key\n"
#printf -- "--------------------------\n\n"

#SENTRY_SECRET_KEY=`docker run --rm sentry config generate-secret-key`
#echo "${SENTRY_SECRET_KEY}"
SENTRY_SECRET_KEY=dev

# These docker runs can probbaly just exec in the running sentry container? (don't stop it ^)
printf -- "\n--------------------------\n\n"
printf "Setting up database\n"
printf -- "--------------------------\n\n"

docker-compose -f ./docker-compose.yml -f ./compose-files/sentry/docker-compose.yml run \
  -e SENTRY_SECRET_KEY=$SENTRY_SECRET_KEY \
  -e SENTRY_POSTGRES_HOST=postgres \
  -e SENTRY_DB_USER=sentry \
  -e SENTRY_DB_PASSWORD=test \
  -e SENTRY_REDIS_HOST=redis \
  -e SENTRY_SINGLE_ORGANIZATION=true \
  sentry upgrade --noinput --lock

printf -- "--------------------------\n\n"
printf "Creating admin user\n"
printf -- "--------------------------\n\n"

docker-compose -f ./docker-compose.yml -f ./compose-files/sentry/docker-compose.yml run --rm \
  -e SENTRY_SECRET_KEY=$SENTRY_SECRET_KEY \
  -e SENTRY_POSTGRES_HOST=postgres \
  -e SENTRY_DB_USER=sentry \
  -e SENTRY_DB_PASSWORD=test \
  -e SENTRY_REDIS_HOST=redis \
  -e SENTRY_SINGLE_ORGANIZATION=true \
  sentry createuser --email=support@place.tech --password=test --superuser --no-input

# Don't edit docker-compose - temp key for dev
#printf -- "--------------------------\n\n"
#printf "Replacing secret key in docker-compose.yml\n"
#printf -- "--------------------------\n\n"

#SENTRY_SECRET_KEY=$(echo $SENTRY_SECRET_KEY | sed 's/\&/\\&/g')
#SENTRY_SECRET_KEY=$(echo $SENTRY_SECRET_KEY | sed 's/\^/\\^/g')
#sed -i "s/SENTRY_SECRET_KEY=temp/SENTRY_SECRET_KEY='${SENTRY_SECRET_KEY}'/" ./docker-compose.yml

printf -- "--------------------------\n\n"
printf "Recreating Sentry containers\n"
printf -- "--------------------------\n\n"

docker-compose -f docker-compose.yml -f compose-files/sentry/docker-compose.yml \
    up -d sentry sentry-cron sentry-worker

printf -- "--------------------------\n\n"
printf "You should now be able to login to localhost:8989 as support@place.tech:test\n"
printf -- "--------------------------\n\n"
