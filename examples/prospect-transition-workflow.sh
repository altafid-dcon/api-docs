#!/bin/bash
# Prospect API - Transition Workflow Example
# Moves a workflow to the next stage in the pipeline

API_BASE_URL="https://api.altafid.dev.altafid.net"
TENANT_UUID="${TENANT_UUID:-your-tenant-uuid}"
STAFF_UUID="${STAFF_UUID:-your-staff-uuid}"
TOKEN="${TOKEN:-your-access-token}"

# Required: Workflow UUID and target stage UUID
WORKFLOW_UUID="workflow-uuid-123"
TARGET_STAGE_UUID="stage-uuid-789"

# Optional: Notes about the transition
TRANSITION_NOTES="Qualified lead - moving to demo stage"

# Perform manual transition
response=$(curl -s -X POST "${API_BASE_URL}/api/v1/prospect/workflows/${WORKFLOW_UUID}/transitions/manual" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "x-tenant-uuid: ${TENANT_UUID}" \
  -H "x-staff-uuid: ${STAFF_UUID}" \
  -H "Content-Type: application/json" \
  -d @- <<EOF
{
  "targetStageUuid": "${TARGET_STAGE_UUID}",
  "notes": "${TRANSITION_NOTES}"
}
EOF
)

echo "Transition response:"
echo "$response" | jq '.' 2>/dev/null || echo "$response"

# Or use drag-drop transition (for kanban-style UI)
# This is useful when reordering workflows within a stage:
# curl -X POST "${API_BASE_URL}/api/v1/prospect/workflows/${WORKFLOW_UUID}/transitions/drag" \
#   -H "Authorization: Bearer ${TOKEN}" \
#   -H "x-tenant-uuid: ${TENANT_UUID}" \
#   -H "x-staff-uuid: ${STAFF_UUID}" \
#   -H "Content-Type: application/json" \
#   -d "{\"targetStageUuid\": \"${TARGET_STAGE_UUID}\", \"position\": 0}"
