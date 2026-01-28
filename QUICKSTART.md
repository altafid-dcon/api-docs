# Quick Start Guide

Get started with the Altafid API in 5 minutes.

---

## 1. Authenticate and Get Tokens

First, you need to login to obtain access and refresh tokens.

### Login Request

```bash
curl 'https://api.altafid.dev.altafid.net/api/auth/login' \
  -X POST \
  -H 'accept: application/json' \
  -H 'content-type: application/json' \
  --data-raw '{
    "username": "your-email@example.com",
    "password": "your-password"
  }'
```

### Response

```json
{
  "accessToken": "eyJhbGciOiJIUzI1NiJ9...",
  "refreshToken": "eyJhbGciOiJIUzI1NiJ9...",
  "tokenType": "Bearer",
  "expiresIn": 86400,
  "user": {
    "id": "TS019A25A48E6177E8B989E9AECCA3F6DF",
    "email": "your-email@example.com",
    "tenantUuid": "T019A16FF372A70B5A9307B00CE85E4DA",
    ...
  }
}
```

**Save these values**:
- `accessToken` - Use for API requests
- `refreshToken` - Use to get new access token
- `user.tenantUuid` - Your tenant UUID
- `user.id` - Your user ID
- `user.email` - Your email

---

## 2. Make Your First API Call

### Test Authentication

```bash
curl 'https://api.altafid.dev.altafid.net/api/tenant-staff/all/paginated?page=0&size=1' \
  -H 'accept: application/json' \
  -H 'authorization: Bearer YOUR_ACCESS_TOKEN' \
  -H 'x-tenant-uuid: YOUR_TENANT_UUID' \
  -H 'x-user-email: your-email@example.com' \
  -H 'x-user-id: YOUR_USER_ID' \
  -H 'x-user-type: TENANT_STAFF'
```

If successful, you'll receive a JSON response with staff data.

---

## 3. Common Use Cases

### Create a Task

```bash
curl 'https://api.altafid.dev.altafid.net/api/tasks' \
  -X POST \
  -H 'accept: application/json' \
  -H 'authorization: Bearer YOUR_ACCESS_TOKEN' \
  -H 'content-type: application/json' \
  -H 'x-tenant-uuid: YOUR_TENANT_UUID' \
  -H 'x-user-email: your-email@example.com' \
  -H 'x-user-id: YOUR_USER_ID' \
  -H 'x-user-type: TENANT_STAFF' \
  --data '{
    "taskName": "My First Task",
    "taskType": "TODO",
    "queue": "ACCOUNT_ONBOARDING",
    "status": "OPEN",
    "priority": "MEDIUM",
    "partnerId": "YOUR_TENANT_UUID",
    "assignedToId": "YOUR_USER_ID",
    "dueDate": "2026-02-01T00:00:00.000Z",
    "description": "<p>This is my first task via API</p>",
    "createdById": "YOUR_USER_ID",
    "createdByType": "ADVISOR_STAFF"
  }'
```

### Search for a Contact

```bash
curl 'https://api.altafid.dev.altafid.net/api/contacts/firm/TENANT/YOUR_TENANT_UUID?searchTerm=john&page=0&size=20' \
  -H 'accept: application/json' \
  -H 'authorization: Bearer YOUR_ACCESS_TOKEN' \
  -H 'x-tenant-uuid: YOUR_TENANT_UUID' \
  -H 'x-user-email: your-email@example.com' \
  -H 'x-user-id: YOUR_USER_ID' \
  -H 'x-user-type: TENANT_STAFF'
```

### Find a Staff Member

```bash
curl 'https://api.altafid.dev.altafid.net/api/tenant-staff/search?name=admin&page=0&size=20' \
  -H 'accept: application/json' \
  -H 'authorization: Bearer YOUR_ACCESS_TOKEN' \
  -H 'x-tenant-uuid: YOUR_TENANT_UUID' \
  -H 'x-user-email: your-email@example.com' \
  -H 'x-user-id: YOUR_USER_ID' \
  -H 'x-user-type: TENANT_STAFF'
```

---

## 4. Use Example Scripts

We provide ready-to-use bash scripts in the `examples/` folder:

```bash
# Make scripts executable
chmod +x examples/*.sh

# Login and get tokens
./examples/login.sh

# Create a task
./examples/create-task.sh

# Search for contacts
./examples/search-contact.sh john

# List staff members
./examples/list-staff.sh

# Refresh your token
./examples/refresh-token.sh

# Logout
./examples/logout.sh
```

---

## 5. Error Handling

### Common HTTP Status Codes

| Code | Meaning | Action |
|------|---------|--------|
| 200 | Success | Request completed successfully |
| 401 | Unauthorized | Check your access token |
| 403 | Forbidden | Verify permissions |
| 404 | Not Found | Check endpoint URL |
| 500 | Server Error | Contact support |

### Example Error Response

```json
{
  "error": {
    "code": "UNAUTHORIZED",
    "message": "Invalid or expired access token",
    "details": {}
  }
}
```

---

## 6. Best Practices

✅ **DO**:
- Store credentials securely (use environment variables)
- Implement retry logic for failed requests
- Cache frequently accessed data
- Use pagination for large datasets
- Log all API interactions

❌ **DON'T**:
- Hardcode credentials in your code
- Make excessive API calls in loops
- Ignore error responses
- Store sensitive data in plain text

---

## 7. SDKs and Libraries

### JavaScript/Node.js

```javascript
const axios = require('axios');

// 1. Login first
async function login(username, password) {
  const response = await axios.post(
    'https://api.altafid.dev.altafid.net/api/auth/login',
    { username, password }
  );
  return response.data;
}

// 2. Create API client with tokens
function createAPIClient(accessToken, tenantUuid, userEmail, userId) {
  return axios.create({
    baseURL: 'https://api.altafid.dev.altafid.net',
    headers: {
      'Authorization': `Bearer ${accessToken}`,
      'x-tenant-uuid': tenantUuid,
      'x-user-email': userEmail,
      'x-user-id': userId,
      'x-user-type': 'TENANT_STAFF'
    }
  });
}

// 3. Use the API
async function main() {
  // Login
  const auth = await login('your-email@example.com', 'your-password');
  
  // Create API client
  const api = createAPIClient(
    auth.accessToken,
    auth.user.tenantUuid,
    auth.user.email,
    auth.user.id
  );
  
  // Create a task
  const task = await api.post('/api/tasks', {
    taskName: 'My Task',
    taskType: 'TODO',
    queue: 'ACCOUNT_ONBOARDING',
    status: 'OPEN',
    priority: 'MEDIUM',
    partnerId: auth.user.tenantUuid,
    assignedToId: auth.user.id,
    dueDate: '2026-02-01T00:00:00.000Z',
    description: '<p>Task description</p>',
    createdById: auth.user.id,
    createdByType: 'ADVISOR_STAFF'
  });
  
  console.log('Task created:', task.data);
}

main().catch(console.error);
```

### Python

```python
import requests

class AltafidAPI:
    def __init__(self):
        self.base_url = 'https://api.altafid.dev.altafid.net'
        self.access_token = None
        self.refresh_token = None
        self.user_info = None
    
    def login(self, username, password):
        """Login and store tokens"""
        response = requests.post(
            f'{self.base_url}/api/auth/login',
            json={'username': username, 'password': password}
        )
        response.raise_for_status()
        
        data = response.json()
        self.access_token = data['accessToken']
        self.refresh_token = data['refreshToken']
        self.user_info = data['user']
        
        return data
    
    def _get_headers(self):
        """Get authenticated headers"""
        return {
            'Authorization': f'Bearer {self.access_token}',
            'x-tenant-uuid': self.user_info['tenantUuid'],
            'x-user-email': self.user_info['email'],
            'x-user-id': self.user_info['id'],
            'x-user-type': 'TENANT_STAFF'
        }
    
    def create_task(self, task_data):
        """Create a new task"""
        response = requests.post(
            f'{self.base_url}/api/tasks',
            json=task_data,
            headers=self._get_headers()
        )
        response.raise_for_status()
        return response.json()
    
    def refresh_access_token(self):
        """Refresh the access token"""
        response = requests.post(
            f'{self.base_url}/api/auth/refresh',
            json={'refreshToken': self.refresh_token}
        )
        response.raise_for_status()
        
        data = response.json()
        self.access_token = data['accessToken']
        self.refresh_token = data.get('refreshToken', self.refresh_token)
        
        return data

# Usage
api = AltafidAPI()

# Login
api.login('your-email@example.com', 'your-password')

# Create a task
task = api.create_task({
    'taskName': 'My Task',
    'taskType': 'TODO',
    'queue': 'ACCOUNT_ONBOARDING',
    'status': 'OPEN',
    'priority': 'MEDIUM',
    'partnerId': api.user_info['tenantUuid'],
    'assignedToId': api.user_info['id'],
    'dueDate': '2026-02-01T00:00:00.000Z',
    'description': '<p>Task description</p>',
    'createdById': api.user_info['id'],
    'createdByType': 'ADVISOR_STAFF'
})

print('Task created:', task)
```

---

## 8. Next Steps

1. ✅ Read the [full API documentation](README.md)
2. ✅ Review [authentication details](docs/authentication.md)
3. ✅ Explore specific endpoints:
   - [Contacts API](docs/contacts.md)
   - [Tasks API](docs/tasks.md)
   - [Tenant Staff API](docs/tenant-staff.md)
4. ✅ Join our developer community
5. ✅ Subscribe to API updates

---

## Support

Need help? We're here for you:

- 📧 **Email**: api-support@altafid.com
- 💬 **Slack**: [Join our channel](#)
- 📚 **Documentation**: [docs.altafid.com](https://docs.altafid.com)
- 🐛 **Bug Reports**: [GitHub Issues](https://github.com/altafid/api-docs/issues)

---

**Happy coding! 🚀**
