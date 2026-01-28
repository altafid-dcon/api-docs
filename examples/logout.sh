#!/bin/bash

# Altafid API - Logout Example
# This script demonstrates how to logout and invalidate tokens

API_BASE_URL="https://api.altafid.dev.altafid.net"
ACCESS_TOKEN="${ACCESS_TOKEN:-YOUR_ACCESS_TOKEN_HERE}"
TENANT_UUID="${TENANT_UUID:-YOUR_TENANT_UUID}"
USER_EMAIL="${USER_EMAIL:-your-email@example.com}"
USER_ID="${USER_ID:-YOUR_USER_ID}"

# Perform logout
curl "${API_BASE_URL}/api/auth/logout" \
  -X POST \
  -H "accept: application/json" \
  -H "authorization: Bearer ${ACCESS_TOKEN}" \
  -H "content-length: 0" \
  -H "x-tenant-uuid: ${TENANT_UUID}" \
  -H "x-user-email: ${USER_EMAIL}" \
  -H "x-user-id: ${USER_ID}" \
  -H "x-user-type: TENANT_STAFF"

echo ""
echo "Logged out successfully!"
echo "Your tokens have been invalidated."
