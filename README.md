# Altafid API Documentation

## Overview

The Altafid API provides programmatic access to manage contacts, tasks, accounts, and notes within the Altafid platform. This RESTful API uses standard HTTP methods and returns JSON responses.

**Base URL**: `https://api.altafid.dev.altafid.net`

**Environment**: UAT (Development)

---

## Authentication

The Altafid API uses token-based authentication with access and refresh tokens. All authenticated API requests require a Bearer token and additional headers for tenant context.

### Authentication Flow

1. **Login** - Obtain access and refresh tokens
2. **Use Access Token** - Include in API requests
3. **Refresh Token** - Get new access token when expired
4. **Logout** - Invalidate tokens

---

### Login

Authenticate a user and receive access and refresh tokens.

**Endpoint**: `POST /api/auth/login`

**Request Body**:

```json
{
  "username": "user@example.com",
  "password": "your_password"
}
```

**Example Request**:

```bash
curl 'https://api.altafid.dev.altafid.net/api/auth/login' \
  -X POST \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  --data-raw '{
    "username": "user@example.com",
    "password": "Password123"
  }'
```

**Example Response**:

```json
{
  "accessToken": "eyJhbGciOiJIUzI1NiJ9...",
  "refreshToken": "eyJhbGciOiJIUzI1NiJ9...",
  "tokenType": "Bearer",
  "expiresIn": 86400,
  "user": {
    "id": "TS019A25A48E6177E8B989E9AECCA3F6DF",
    "email": "user@example.com",
    "firstName": "John",
    "lastName": "Doe",
    "tenantUuid": "T019A16FF372A70B5A9307B00CE85E4DA",
    "tenantCode": "CONPAT_UAT",
    "roles": ["TENANT_ADMIN", "ADMIN", "MANAGER", "USER"],
    "permissions": ["READ_SETTINGS", "CREATE_REPORT", "READ_TENANTS", ...]
  }
}
```

**Response Fields**:

| Field | Type | Description |
|-------|------|-------------|
| `accessToken` | string | JWT access token (valid for 24 hours) |
| `refreshToken` | string | JWT refresh token (used to get new access token) |
| `tokenType` | string | Token type (always "Bearer") |
| `expiresIn` | integer | Token expiration time in seconds |
| `user` | object | User information and permissions |

---

### Refresh Token

Obtain a new access token using a refresh token when the current access token expires.

**Endpoint**: `POST /api/auth/refresh`

**Request Body**:

```json
{
  "refreshToken": "eyJhbGciOiJIUzI1NiJ9..."
}
```

**Example Request**:

```bash
curl 'https://api.altafid.dev.altafid.net/api/auth/refresh' \
  -X POST \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json' \
  --data-raw '{
    "refreshToken": "eyJhbGciOiJIUzI1NiJ9..."
  }'
```

**Example Response**:

```json
{
  "accessToken": "eyJhbGciOiJIUzI1NiJ9...",
  "refreshToken": "eyJhbGciOiJIUzI1NiJ9...",
  "tokenType": "Bearer",
  "expiresIn": 86400
}
```

**Best Practices**:
- Store refresh tokens securely
- Implement automatic token refresh before expiration
- Handle 401 errors by attempting token refresh

---

### Logout

Invalidate the current session and tokens.

**Endpoint**: `POST /api/auth/logout`

**Required Headers**:

```http
Authorization: Bearer {ACCESS_TOKEN}
x-tenant-uuid: {TENANT_UUID}
x-user-email: {USER_EMAIL}
x-user-id: {USER_ID}
x-user-type: TENANT_STAFF
```

**Example Request**:

```bash
curl 'https://api.altafid.dev.altafid.net/api/auth/logout' \
  -X POST \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9...' \
  -H 'Content-Length: 0' \
  -H 'x-tenant-uuid: T019A16FF372A70B5A9307B00CE85E4DA' \
  -H 'x-user-email: user@example.com' \
  -H 'x-user-id: TS019A25A48E6177E8B989E9AECCA3F6DF' \
  -H 'x-user-type: TENANT_STAFF'
```

**Example Response**:

```json
{
  "message": "Logged out successfully"
}
```

---

### Authenticated Request Headers

All API requests (except login, refresh) require these headers:

| Header | Type | Required | Description |
|--------|------|----------|-------------|
| `Authorization` | string | Yes | Bearer token format: `Bearer {ACCESS_TOKEN}` |
| `x-tenant-uuid` | string | Yes | UUID of the tenant/firm |
| `x-user-email` | string | Yes | Email address of the authenticated user |
| `x-user-id` | string | Yes | UUID of the authenticated user |
| `x-user-type` | string | Yes | Type of user (e.g., `TENANT_STAFF`) |

### Example Authenticated Request

```bash
curl 'https://api.altafid.dev.altafid.net/api/tasks' \
  -H 'Authorization: Bearer eyJhbGc...' \
  -H 'x-tenant-uuid: T019A16FF372A70B5A9307B00CE85E4DA' \
  -H 'x-user-email: user@example.com' \
  -H 'x-user-id: TS019A25A48E6177E8B989E9AECCA3F6DF' \
  -H 'x-user-type: TENANT_STAFF'
```

### Token Expiration

- **Access Token**: Valid for 24 hours (86400 seconds)
- **Refresh Token**: Valid for 7 days (configurable)
- Store tokens securely and never expose them in client-side code
- Implement automatic token refresh 5 minutes before expiration

---

## Rate Limits

*To be documented*

---

## Error Handling

### Standard Error Response

```json
{
  "error": {
    "code": "ERROR_CODE",
    "message": "Human readable error message",
    "details": {}
  }
}
```

### HTTP Status Codes

| Code | Description |
|------|-------------|
| 200 | Success |
| 201 | Created |
| 400 | Bad Request |
| 401 | Unauthorized |
| 403 | Forbidden |
| 404 | Not Found |
| 500 | Internal Server Error |

---

## API Resources

- [Authentication](#authentication) - Login, Logout, Refresh Token
- [Contacts](#contacts) - Manage contacts and clients
- [Tenant Staff](#tenant-staff) - Manage staff members
- [Tasks](#tasks) - Create and manage tasks
- [Accounts](#accounts) *(Coming soon)* - Manage firm accounts
- [Notes](#notes) *(Coming soon)* - Manage notes and comments

---

## Contacts

Manage contact information for clients and prospects.

### List Contacts

Retrieve a paginated list of contacts for a specific firm/tenant.

**Endpoint**: `GET /api/contacts/firm/TENANT/{tenantUuid}`

**Parameters**:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `tenantUuid` | string | Yes | UUID of the tenant/firm |
| `page` | integer | No | Page number (default: 0) |
| `size` | integer | No | Page size (default: 20, max: 100) |
| `searchTerm` | string | No | Search by first name, last name, email, or middle name |

**Example Request**:

```bash
curl 'https://api.altafid.dev.altafid.net/api/contacts/firm/TENANT/T019A16FF372A70B5A9307B00CE85E4DA?page=0&size=20' \
  -H 'accept: application/json' \
  -H 'authorization: Bearer {ACCESS_TOKEN}' \
  -H 'x-tenant-uuid: T019A16FF372A70B5A9307B00CE85E4DA' \
  -H 'x-user-email: user@example.com' \
  -H 'x-user-id: TS019A25A48E6177E8B989E9AECCA3F6DF' \
  -H 'x-user-type: TENANT_STAFF'
```

**Example Response**:

```json
{
  "content": [
    {
      "id": "C019BFE58866178B5993B7A1DCC361E28",
      "firstName": "John",
      "lastName": "Smith",
      "middleName": null,
      "email": "john.smith@example.com",
      "phone": "+1234567890",
      "createdAt": "2026-01-15T10:30:00Z",
      "updatedAt": "2026-01-20T14:22:00Z"
    }
  ],
  "pageable": {
    "pageNumber": 0,
    "pageSize": 20,
    "offset": 0,
    "paged": true
  },
  "totalElements": 45,
  "totalPages": 3,
  "last": false,
  "size": 20,
  "number": 0,
  "first": true,
  "numberOfElements": 20,
  "empty": false
}
```

### Search Contacts

Search for contacts by name or email.

**Endpoint**: `GET /api/contacts/firm/TENANT/{tenantUuid}`

**Parameters**:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `tenantUuid` | string | Yes | UUID of the tenant/firm |
| `searchTerm` | string | Yes | Search query (first name, last name, email, middle name) |
| `page` | integer | No | Page number (default: 0) |
| `size` | integer | No | Page size (default: 20, max: 100) |

**Example Request**:

```bash
curl 'https://api.altafid.dev.altafid.net/api/contacts/firm/TENANT/T019A16FF372A70B5A9307B00CE85E4DA?page=0&size=20&searchTerm=contact' \
  -H 'accept: application/json' \
  -H 'authorization: Bearer {ACCESS_TOKEN}' \
  -H 'x-tenant-uuid: T019A16FF372A70B5A9307B00CE85E4DA' \
  -H 'x-user-email: user@example.com' \
  -H 'x-user-id: TS019A25A48E6177E8B989E9AECCA3F6DF' \
  -H 'x-user-type: TENANT_STAFF'
```

**Example Response**:

```json
{
  "content": [
    {
      "id": "C019BFE58866178B5993B7A1DCC361E28",
      "firstName": "Just",
      "lastName": "Contact6",
      "email": "contact6@example.com"
    }
  ],
  "totalElements": 1,
  "totalPages": 1
}
```

---

## Tenant Staff

Manage staff members within a tenant organization.

### List All Tenant Staff

Retrieve a paginated list of all staff members.

**Endpoint**: `GET /api/tenant-staff/all/paginated`

**Parameters**:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `page` | integer | No | Page number (default: 0) |
| `size` | integer | No | Page size (default: 20, max: 100) |

**Example Request**:

```bash
curl 'https://api.altafid.dev.altafid.net/api/tenant-staff/all/paginated?page=0&size=20' \
  -H 'accept: application/json' \
  -H 'authorization: Bearer {ACCESS_TOKEN}' \
  -H 'x-tenant-uuid: T019A16FF372A70B5A9307B00CE85E4DA' \
  -H 'x-user-email: user@example.com' \
  -H 'x-user-id: TS019A25A48E6177E8B989E9AECCA3F6DF' \
  -H 'x-user-type: TENANT_STAFF'
```

**Example Response**:

```json
{
  "content": [
    {
      "id": "TS019A25A48E6177E8B989E9AECCA3F6DF",
      "firstName": "Suhas",
      "lastName": "Admin",
      "middleName": null,
      "email": "conpat_suhas_admin@yopmail.com",
      "staffType": "ADMIN",
      "roles": ["TENANT_ADMIN", "ADMIN", "MANAGER", "USER"],
      "createdAt": "2025-12-01T08:00:00Z"
    }
  ],
  "pageable": {
    "pageNumber": 0,
    "pageSize": 20
  },
  "totalElements": 12,
  "totalPages": 1
}
```

### Search Tenant Staff

Search for staff members by name.

**Endpoint**: `GET /api/tenant-staff/search`

**Parameters**:

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `name` | string | Yes | Search query (first name, last name, email, middle name) |
| `page` | integer | No | Page number (default: 0) |
| `size` | integer | No | Page size (default: 20, max: 100) |

**Example Request**:

```bash
curl 'https://api.altafid.dev.altafid.net/api/tenant-staff/search?page=0&size=20&name=suhas' \
  -H 'accept: application/json' \
  -H 'authorization: Bearer {ACCESS_TOKEN}' \
  -H 'x-tenant-uuid: T019A16FF372A70B5A9307B00CE85E4DA' \
  -H 'x-user-email: user@example.com' \
  -H 'x-user-id: TS019A25A48E6177E8B989E9AECCA3F6DF' \
  -H 'x-user-type: TENANT_STAFF'
```

**Example Response**:

```json
{
  "content": [
    {
      "id": "TS019A25A48E6177E8B989E9AECCA3F6DF",
      "firstName": "Suhas",
      "lastName": "Admin",
      "email": "conpat_suhas_admin@yopmail.com",
      "staffType": "ADMIN"
    }
  ],
  "totalElements": 1
}
```

---

## Tasks

Manage tasks and action items within the platform.

### Create Task

Create a new task in the system.

**Endpoint**: `POST /api/tasks`

**Request Body**:

```json
{
  "taskName": "string",
  "taskType": "EMAIL" | "CALL" | "TODO",
  "queue": "string",
  "status": "OPEN" | "IN_PROGRESS" | "COMPLETED",
  "priority": "LOW" | "MEDIUM" | "HIGH",
  "partnerId": "string",
  "contactId": "string",
  "assignedToId": "string",
  "dueDate": "string (ISO 8601)",
  "description": "string (HTML)",
  "createdById": "string",
  "createdByType": "ADVISOR_STAFF"
}
```

**Field Descriptions**:

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `taskName` | string | Yes | Name/title of the task |
| `taskType` | enum | Yes | Type of task: `EMAIL`, `CALL`, or `TODO` |
| `queue` | string | Yes | Queue identifier (e.g., `ACCOUNT_ONBOARDING`) |
| `status` | enum | Yes | Current status: `OPEN`, `IN_PROGRESS`, `COMPLETED` |
| `priority` | enum | Yes | Priority level: `LOW`, `MEDIUM`, `HIGH` |
| `partnerId` | string | Yes | UUID of the tenant/firm |
| `contactId` | string | No | UUID of the associated contact |
| `assignedToId` | string | Yes | UUID of the staff member assigned |
| `dueDate` | string | Yes | Due date in ISO 8601 format |
| `description` | string | Yes | Task description (supports HTML) |
| `createdById` | string | Yes | UUID of the user creating the task |
| `createdByType` | string | Yes | Type of creator (e.g., `ADVISOR_STAFF`) |

**Example Request**:

```bash
curl 'https://api.altafid.dev.altafid.net/api/tasks' \
  -H 'accept: application/json' \
  -H 'authorization: Bearer {ACCESS_TOKEN}' \
  -H 'content-type: application/json' \
  -H 'x-tenant-uuid: T019A16FF372A70B5A9307B00CE85E4DA' \
  -H 'x-user-email: user@example.com' \
  -H 'x-user-id: TS019A25A48E6177E8B989E9AECCA3F6DF' \
  -H 'x-user-type: TENANT_STAFF' \
  --data-raw '{
    "taskName": "Follow up on portfolio review",
    "taskType": "EMAIL",
    "queue": "ACCOUNT_ONBOARDING",
    "status": "OPEN",
    "priority": "HIGH",
    "partnerId": "T019A16FF372A70B5A9307B00CE85E4DA",
    "contactId": "C019BFE58866178B5993B7A1DCC361E28",
    "assignedToId": "TS019A25A48E6177E8B989E9AECCA3F6DF",
    "dueDate": "2026-01-29T00:00:00.000Z",
    "description": "<p>Send updated portfolio allocation report to client</p>",
    "createdById": "TS019A25A48E6177E8B989E9AECCA3F6DF",
    "createdByType": "ADVISOR_STAFF"
  }'
```

**Example Response**:

```json
{
  "id": "TK019C1234567890ABCDEF",
  "taskName": "Follow up on portfolio review",
  "taskType": "EMAIL",
  "queue": "ACCOUNT_ONBOARDING",
  "status": "OPEN",
  "priority": "HIGH",
  "partnerId": "T019A16FF372A70B5A9307B00CE85E4DA",
  "contactId": "C019BFE58866178B5993B7A1DCC361E28",
  "assignedToId": "TS019A25A48E6177E8B989E9AECCA3F6DF",
  "dueDate": "2026-01-29T00:00:00.000Z",
  "description": "<p>Send updated portfolio allocation report to client</p>",
  "createdById": "TS019A25A48E6177E8B989E9AECCA3F6DF",
  "createdByType": "ADVISOR_STAFF",
  "createdAt": "2026-01-27T15:30:00Z",
  "updatedAt": "2026-01-27T15:30:00Z"
}
```

### Task Type Reference

| Value | Description |
|-------|-------------|
| `EMAIL` | Email-based task |
| `CALL` | Phone call task |
| `TODO` | General to-do item |

### Priority Reference

| Value | Description |
|-------|-------------|
| `LOW` | Low priority task |
| `MEDIUM` | Medium priority task |
| `HIGH` | High priority task |

### Queue Reference

| Value | Description |
|-------|-------------|
| `ACCOUNT_ONBOARDING` | Account onboarding queue |
| *(Additional queues to be documented)* | |

---

## Accounts

*Coming soon*

Manage account/firm information.

---

## Notes

*Coming soon*

Manage notes associated with contacts, accounts, and tasks.

---

## Webhooks

*Coming soon*

Subscribe to real-time events in the Altafid platform.

---

## Changelog

### Version 1.0.0 (January 2026)
- Initial API documentation
- Contacts endpoints
- Tenant Staff endpoints
- Tasks creation endpoint

---

## Support

For API support, please contact:

- **Email**: support@altafid.com
- **Documentation**: https://docs.altafid.com
- **Status Page**: https://status.altafid.com

---

## Terms of Service

By using the Altafid API, you agree to our [Terms of Service](#) and [Privacy Policy](#).

---

*Last updated: January 27, 2026*
