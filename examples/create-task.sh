#!/bin/bash

# Altafid API - Create Task Example
# Replace placeholder values with your actual credentials

API_BASE_URL="https://api.altafid.dev.altafid.net"
ACCESS_TOKEN="YOUR_ACCESS_TOKEN_HERE"
TENANT_UUID="YOUR_TENANT_UUID"
USER_EMAIL="your-email@example.com"
USER_ID="YOUR_USER_ID"

# Create a new task
curl "${API_BASE_URL}/api/tasks" \
  -X POST \
  -H "accept: application/json" \
  -H "authorization: Bearer ${ACCESS_TOKEN}" \
  -H "content-type: application/json" \
  -H "x-tenant-uuid: ${TENANT_UUID}" \
  -H "x-user-email: ${USER_EMAIL}" \
  -H "x-user-id: ${USER_ID}" \
  -H "x-user-type: TENANT_STAFF" \
  --data '{
    "taskName": "Follow up on portfolio review",
    "taskType": "EMAIL",
    "queue": "ACCOUNT_ONBOARDING",
    "status": "OPEN",
    "priority": "HIGH",
    "partnerId": "'"${TENANT_UUID}"'",
    "contactId": "CONTACT_ID_HERE",
    "assignedToId": "STAFF_ID_HERE",
    "dueDate": "2026-01-29T00:00:00.000Z",
    "description": "<p>Send updated portfolio allocation report to client</p>",
    "createdById": "'"${USER_ID}"'",
    "createdByType": "ADVISOR_STAFF"
  }'

echo ""
echo "Task created successfully!"
