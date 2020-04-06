# Monitor Host

- In .env set:
  - DOMAIN=example.com (kibana. will be prepended, make sure you have dns or host entries for kibana.example.com)
  - BASIC_PASSWORD (for nginx basic auth)


- Run ./setup.sh to:
  - Create basic auth file
  - Create self-signed ssl certs
  - Start the containers


- Go to https://$DOMAIN and login with the basic auth to access Kibana
