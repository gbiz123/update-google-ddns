# update-google-ddns
If an IP address change is detected, update Google Dynamic DNS record with the API

This script checks my IP address and updates Google DDNS if it has changed
API reference: https://support.google.com/domains/answer/6147083?authuser=1&hl=en

This script expects your Google Dynamic DNS credentials and Domain name to be exported as:
  Username: $GOOGLE_DNS_USERNAME
  Password: $GOOGLE_DNS_PASSWORD
  Domain name: $MY_DOMAIN_NAME

