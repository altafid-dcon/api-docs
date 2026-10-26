#!/bin/bash
# Prospect API - List Workflows Example
# Retrieves workflows with filtering, pagination, and sorting

API_BASE_URL="https://api.altafid.dev.altafid.net"
TENANT_UUID="${TENANT_UUID:-your-tenant-uuid}"
STAFF_UUID="${STAFF_UUID:-your-staff-uuid}"
TOKEN="${TOKEN:-your-access-token}"

# Pagination
PAGE=0
SIZE=20

# Optional filters
STAGE_UUID=""        # Filter by stage
PRIORITY="HIGH"      # Filter by priority (LOW, MEDIUM, HIGH)
WORKFLOW_STATUS="ACTIVE"  # ACTIVE, LOST, COMPLETED
SORT_COLUMN="createdAt"
SORT_ORDER="desc"

# Build query params
QUERY_PARAMS="page=${PAGE}&size=${SIZE}"

if [ -n "$STAGE_UUID" ]; then
  QUERY_PARAMS="${QUERY_PARAMS}&stageUuid=${STAGE_UUID}"
fi

if [ -n "$PRIORITY" ]; then
  QUERY_PARAMS="${QUERY_PARAMS}&priority=${PRIORITY}"
fi

if [ -n "$WORKFLOW_STATUS" ]; then
  QUERY_PARAMS="${QUERY_PARAMS}&workflowStatus=${WORKFLOW_STATUS}"
fi

if [ -n "$SORT_COLUMN" ]; then
  QUERY_PARAMS="${QUERY_PARAMS}&sortColumn=${SORT_COLUMN}&sortOrder=${SORT_ORDER}"
fi

# List workflows
response=$(curl -s -X GET "${API_BASE_URL}/api/v1/prospect/workflows?${QUERY_PARAMS}" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "x-tenant-uuid: ${TENANT_UUID}" \
  -H "x-staff-uuid: ${STAFF_UUID}")

echo "Workflows list response:"
echo "$response" | jq '.' 2>/dev/null || echo "$response"

# Extract pagination info if using jq
if command -v jq &> /dev/null; then
  echo ""
  echo "Pagination info:"
  echo "$response" | jq '{page: .page, size: .size, totalElements: .totalElements, totalPages: .totalPages}'
fi
