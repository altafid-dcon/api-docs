#!/bin/bash

# Altafid API - Login Example
# This script demonstrates how to authenticate and store tokens

API_BASE_URL="https://api.altafid.dev.altafid.net"
USERNAME="your-email@example.com"
PASSWORD="your-password"

# Perform login
response=$(curl -s "${API_BASE_URL}/api/auth/login" \
  -X POST \
  -H "accept: application/json" \
  -H "content-type: application/json" \
  --data-raw "{
    \"username\": \"${USERNAME}\",
    \"password\": \"${PASSWORD}\"
  }")

# Extract tokens using jq (requires jq to be installed)
if command -v jq &> /dev/null; then
    ACCESS_TOKEN=$(echo "$response" | jq -r '.accessToken')
    REFRESH_TOKEN=$(echo "$response" | jq -r '.refreshToken')
    TENANT_UUID=$(echo "$response" | jq -r '.user.tenantUuid')
    USER_ID=$(echo "$response" | jq -r '.user.id')
    USER_EMAIL=$(echo "$response" | jq -r '.user.email')
    
    echo "Login successful!"
    echo ""
    echo "ACCESS_TOKEN=${ACCESS_TOKEN}"
    echo "REFRESH_TOKEN=${REFRESH_TOKEN}"
    echo "TENANT_UUID=${TENANT_UUID}"
    echo "USER_ID=${USER_ID}"
    echo "USER_EMAIL=${USER_EMAIL}"
    echo ""
    echo "Export these as environment variables:"
    echo "export ACCESS_TOKEN='${ACCESS_TOKEN}'"
    echo "export REFRESH_TOKEN='${REFRESH_TOKEN}'"
    echo "export TENANT_UUID='${TENANT_UUID}'"
    echo "export USER_ID='${USER_ID}'"
    echo "export USER_EMAIL='${USER_EMAIL}'"
else
    echo "Response:"
    echo "$response"
    echo ""
    echo "Note: Install 'jq' to automatically extract tokens"
fi
