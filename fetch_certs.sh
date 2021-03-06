#!/bin/bash

EMAIL=${EMAIL}
DOMAINS=(${DOMAINS})

if [ -z "$DOMAINS" ]; then
    echo "ERROR: Domain list is empty or unset"
    exit 1
fi

if [ -z "$EMAIL" ]; then
    echo "ERROR: Email is empty string or unset"
    exit 1
fi

domain_args=""
for i in "${DOMAINS[@]}"
do
   domain_args="$domain_args -d $i"
   # do whatever on $i
done

certbot certonly --standalone \
    --renew-by-default \
    --agree-tos --text \
    --standalone-supported-challenges http-01 \
    $domain_args \
    --email=$EMAIL
