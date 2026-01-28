#!/bin/bash

# Altafid API - List Tenant Staff Example
# Replace placeholder values with your actual credentials

API_BASE_URL="https://api.altafid.dev.altafid.net"
ACCESS_TOKEN="YOUR_ACCESS_TOKEN_HERE"
TENANT_UUID="YOUR_TENANT_UUID"
USER_EMAIL="your-email@example.com"
USER_ID="YOUR_USER_ID"

# List all tenant staff members
curl "${API_BASE_URL}/api/tenant-staff/all/paginated?page=0&size=20" \
  -H "accept: application/json" \
  -H "authorization: Bearer ${ACCESS_TOKEN}" \
  -H "x-tenant-uuid: ${TENANT_UUID}" \
  -H "x-user-email: ${USER_EMAIL}" \
  -H "x-user-id: ${USER_ID}" \
  -H "x-user-type: TENANT_STAFF"

echo ""
echo "Staff list retrieved successfully!"
