#! /bin/bash

cd "$(dirname "$0")" || exit 1
cd ../monitor-host || exit 1

docker-compose up -d

echo "Waiting 10 seconds for nginx config updates"
sleep 10
echo "Restarting monit-nginx"
docker restart monit-nginx
echo -e "\n\n=== Elastic stack setup complete. Login to kibana.localhost with"
echo "admin:development"
