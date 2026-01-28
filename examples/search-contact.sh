#!/bin/bash

# Altafid API - Search Contacts Example
# Replace placeholder values with your actual credentials

API_BASE_URL="https://api.altafid.dev.altafid.net"
ACCESS_TOKEN="YOUR_ACCESS_TOKEN_HERE"
TENANT_UUID="YOUR_TENANT_UUID"
USER_EMAIL="your-email@example.com"
USER_ID="YOUR_USER_ID"
SEARCH_TERM="${1:-contact}" # Use first argument or default to "contact"

# Search for contacts
curl "${API_BASE_URL}/api/contacts/firm/TENANT/${TENANT_UUID}?page=0&size=20&searchTerm=${SEARCH_TERM}" \
  -H "accept: application/json" \
  -H "authorization: Bearer ${ACCESS_TOKEN}" \
  -H "x-tenant-uuid: ${TENANT_UUID}" \
  -H "x-user-email: ${USER_EMAIL}" \
  -H "x-user-id: ${USER_ID}" \
  -H "x-user-type: TENANT_STAFF"

echo ""
echo "Search completed for: ${SEARCH_TERM}"
