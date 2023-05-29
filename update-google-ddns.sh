#!/bin/sh

# This script checks my IP address and updates Google DDNS if it has changed
# API reference: https://support.google.com/domains/answer/6147083?authuser=1&hl=en
#
# This script expects your Google Dynamic DNS credentials and Domain name to be exported as:
#   Username: $GOOGLE_DNS_USERNAME
#   Password: $GOOGLE_DNS_PASSWORD
#   Domain name: $MY_DOMAIN_NAME


# Get our actual IP
ACTUAL_PUBLIC_IP=$(curl ifconfig.me)

# If IP changes, update our DNS records
if [ "$KNOWN_PUBLIC_IP" = "$ACTUAL_PUBLIC_IP" ]; then
    echo "No IP change."
else
    export KNOWN_PUBLIC_IP=$ACTUAL_PUBLIC_IP
    echo "New IP set to $ACTUAL_PUBLIC_IP"
    
    curl https://$GOOGLE_DNS_USERNAME:$GOOGLE_DNS_PASSWORD@domains.google.com/nic/update?hostname=$MY_DOMAIN_NAME&myip=$ACTUAL_PUBLIC_IP
    echo "DNS Records updated."
fi
