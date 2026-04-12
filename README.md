# Soma Automations Website

![Status](https://img.shields.io/badge/Status-Live-green)
![Platform](https://img.shields.io/badge/Platform-GitHub%20Pages-blue)
![Database](https://img.shields.io/badge/Database-Supabase-orange)

## Overview

AI automation agency website that captures contact form submissions and saves them directly to a Supabase database.

## Live Website

**URL:** https://elitesmitpatel.github.io/soma-automations/

## Project Structure

```
soma-automations/
├── index.html              # Main website (single-page application)
├── README.md               # This file
├── serve.py                # Local Python server (development)
├── server.js               # Local Node.js server (development)
├── start-server.ps1        # Local PowerShell server (development)
├── start.bat               # Windows batch file to start server
└── test/                   # Testing & debugging scripts
    ├── README.md           # Test scripts documentation
    └── *.ps1, *.sql        # Various test scripts
```

## Website Sections

| Section | Description |
|---------|-------------|
| Hero | Main headline with animated particles |
| Services | 9 AI automation services offered |
| How It Works | 4-step process explanation |
| Testimonials | Client success stories |
| Contact Form | Form that saves to Supabase |
| Footer | Links and company info |

## Services Offered

1. Personalized Outreach Agent
2. Sales Automation Agent
3. Personal Assistant Agent
4. AI Concierge
5. Speed to Lead
6. Document Processing
7. Follow-up Nurture Sequences
8. Database Reactivation
9. Internal Reporting & Status Notifications

## Tech Stack

- **Frontend:** HTML, CSS, JavaScript (vanilla)
- **Backend:** Supabase (database)
- **Deployment:** GitHub Pages
- **Local Dev:** Python http.server / Node.js

## Database Configuration

### Supabase Project
- **URL:** https://ryoaamutexwdtdpxdlll.supabase.co
- **Table:** `contacts`

### Table Schema
```sql
CREATE TABLE contacts (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  company TEXT,
  service TEXT,
  message TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

### API Key
The website uses the Supabase **Service Role Key** to bypass Row Level Security (RLS).

**Note:** This key is exposed in the frontend code. For production, consider using Supabase Edge Functions or a backend proxy.

## Form Submission Flow

1. User fills contact form on website
2. JavaScript captures form data
3. POST request sent to Supabase REST API
4. Data saved to `contacts` table
5. Success message shown to user

### JavaScript Implementation
```javascript
const SUPABASE_URL = 'https://ryoaamutexwdtdpxdlll.supabase.co';
const SUPABASE_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';

fetch(`${SUPABASE_URL}/rest/v1/contacts`, {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'apikey': SUPABASE_KEY,
    'Authorization': `Bearer ${SUPABASE_KEY}`
  },
  body: JSON.stringify(formData)
});
```

## Local Development

### Option 1: Python
```bash
python3.12 serve.py
# Opens at http://localhost:3000
```

### Option 2: Node.js
```bash
node server.js
# Opens at http://localhost:3000
```

### Option 3: PowerShell
```powershell
powershell -ExecutionPolicy Bypass -File start-server.ps1
```

## GitHub Deployment

1. Code is pushed to GitHub repository
2. GitHub Pages deploys automatically from `main` branch
3. Live URL: https://elitesmitpatel.github.io/soma-automations/

## Contact Form Fields

| Field | Type | Required |
|-------|------|----------|
| Name | text | Yes |
| Email | email | Yes |
| Company | text | No |
| Service | select | Yes |
| Message | textarea | No |

## Troubleshooting

### Form Not Working
1. Check browser console for errors
2. Verify Supabase table exists and has data
3. Ensure RLS is disabled or policy allows inserts

### Supabase Connection
- Test with: `powershell -ExecutionPolicy Bypass -File test/test-post-to-supabase.ps1`
- Check Table Editor in Supabase dashboard

## License

© 2026 Soma Automations. All rights reserved.