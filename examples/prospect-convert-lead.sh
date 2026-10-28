#!/bin/bash
# Prospect API - Convert Lead to Prospect Example
# Converts a qualified lead to an active prospect workflow

API_BASE_URL="https://api.altafid.dev.altafid.net"
TENANT_UUID="${TENANT_UUID:-your-tenant-uuid}"
STAFF_UUID="${STAFF_UUID:-your-staff-uuid}"
TOKEN="${TOKEN:-your-access-token}"

# Required: Contact UUID (the lead) and initial stage UUID
CONTACT_UUID="contact-uuid-lead-123"
INITIAL_STAGE_UUID="stage-uuid-prospecting"

# Optional: Priority, opportunity value
PRIORITY="MEDIUM"
OPPORTUNITY_VALUE=25000

# Convert single lead to prospect
response=$(curl -s -X POST "${API_BASE_URL}/api/v1/prospect/leads/${CONTACT_UUID}/convert" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "x-tenant-uuid: ${TENANT_UUID}" \
  -H "x-staff-uuid: ${STAFF_UUID}" \
  -H "Content-Type: application/json" \
  -d @- <<EOF
{
  "initialStageUuid": "${INITIAL_STAGE_UUID}",
  "priority": "${PRIORITY}",
  "opportunityValue": ${OPPORTUNITY_VALUE}
}
EOF
)

echo "Lead conversion response:"
echo "$response" | jq '.' 2>/dev/null || echo "$response"

# For bulk conversion (multiple leads at once), use /bulk-convert:
# curl -X POST "${API_BASE_URL}/api/v1/prospect/leads/bulk-convert" \
#   -H "Authorization: Bearer ${TOKEN}" \
#   -H "x-tenant-uuid: ${TENANT_UUID}" \
#   -H "x-staff-uuid: ${STAFF_UUID}" \
#   -H "Content-Type: application/json" \
#   -d '[
#     {"contactUuid": "contact-1", "initialStageUuid": "stage-uuid", "priority": "HIGH", "opportunityValue": 50000},
#     {"contactUuid": "contact-2", "initialStageUuid": "stage-uuid", "priority": "MEDIUM", "opportunityValue": 25000}
#   ]'
