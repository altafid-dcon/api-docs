#!/bin/bash
# Prospect API - Create Workflow Example
# Creates a new prospect workflow for a contact moving through sales pipeline

API_BASE_URL="https://api.altafid.dev.altafid.net"
TENANT_UUID="${TENANT_UUID:-your-tenant-uuid}"
STAFF_UUID="${STAFF_UUID:-your-staff-uuid}"
TOKEN="${TOKEN:-your-access-token}"

# Required: Contact UUID and Stage UUID
CONTACT_UUID="contact-uuid-123"
INITIAL_STAGE_UUID="stage-uuid-456"

# Optional: Priority (LOW, MEDIUM, HIGH), opportunity value, due date
PRIORITY="HIGH"
OPPORTUNITY_VALUE=50000
DUE_DATE="2026-12-31"

# Create the workflow
response=$(curl -s -X POST "${API_BASE_URL}/api/v1/prospect/workflows" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "x-tenant-uuid: ${TENANT_UUID}" \
  -H "x-staff-uuid: ${STAFF_UUID}" \
  -H "Content-Type: application/json" \
  -d @- <<EOF
{
  "contactUuid": "${CONTACT_UUID}",
  "stageUuid": "${INITIAL_STAGE_UUID}",
  "priority": "${PRIORITY}",
  "opportunityValue": ${OPPORTUNITY_VALUE},
  "prospectDueDate": "${DUE_DATE}",
  "autoAdvance": true
}
EOF
)

echo "Workflow creation response:"
echo "$response" | jq '.' 2>/dev/null || echo "$response"
