#!/usr/bin/env bash
set -euo pipefail

ENGINE_DOMAIN="$1"
ENGINE_EMAIL="$2"
ENGINE_PASSWORD="$3"

# Create an authority for built web app
docker exec -it auth rake domain:add_authority[$ENGINE_DOMAIN,http://$ENGINE_DOMAIN,$ENGINE_EMAIL,$ENGINE_PASSWORD]

# Create application
docker exec -it auth rake domain:add_app[backoffice,http://$ENGINE_DOMAIN]
