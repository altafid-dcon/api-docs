#!/bin/bash

# Altafid API - Refresh Token Example
# This script demonstrates how to refresh an expired access token

API_BASE_URL="https://api.altafid.dev.altafid.net"
REFRESH_TOKEN="${REFRESH_TOKEN:-YOUR_REFRESH_TOKEN_HERE}"

# Refresh the access token
response=$(curl -s "${API_BASE_URL}/api/auth/refresh" \
  -X POST \
  -H "accept: application/json" \
  -H "content-type: application/json" \
  --data-raw "{
    \"refreshToken\": \"${REFRESH_TOKEN}\"
  }")

# Extract new tokens using jq (requires jq to be installed)
if command -v jq &> /dev/null; then
    NEW_ACCESS_TOKEN=$(echo "$response" | jq -r '.accessToken')
    NEW_REFRESH_TOKEN=$(echo "$response" | jq -r '.refreshToken')
    EXPIRES_IN=$(echo "$response" | jq -r '.expiresIn')
    
    echo "Token refresh successful!"
    echo ""
    echo "NEW_ACCESS_TOKEN=${NEW_ACCESS_TOKEN}"
    echo "NEW_REFRESH_TOKEN=${NEW_REFRESH_TOKEN}"
    echo "EXPIRES_IN=${EXPIRES_IN} seconds"
    echo ""
    echo "Update your environment variables:"
    echo "export ACCESS_TOKEN='${NEW_ACCESS_TOKEN}'"
    echo "export REFRESH_TOKEN='${NEW_REFRESH_TOKEN}'"
else
    echo "Response:"
    echo "$response"
    echo ""
    echo "Note: Install 'jq' to automatically extract tokens"
fi
