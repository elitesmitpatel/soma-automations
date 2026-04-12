# Test Scripts - Soma Automations

## Purpose
These scripts were used during development to test and debug the form-to-Supabase connection. They are kept for reference and future debugging.

## Files

| File | Purpose |
|------|---------|
| `test-supabase-connection.ps1` | Tests if Supabase API is reachable |
| `test-post-to-supabase.ps1` | Tests POST request to contacts table |
| `test-final-verification.ps1` | Final verification that data saves correctly |
| `create-rls-policy.sql` | SQL to create RLS policy (not used - we used service role key instead) |
| `README.md` | This documentation file |

## How to Run Tests

### Test Supabase Connection
```powershell
powershell -ExecutionPolicy Bypass -File test-supabase-connection.ps1
```
Expected: Should show if API is accessible

### Test POST to Database
```powershell
powershell -ExecutionPolicy Bypass -File test-post-to-supabase.ps1
```
Expected: Should return SUCCESS if data is saved

### Final Verification
```powershell
powershell -ExecutionPolicy Bypass -File test-final-verification.ps1
```
Expected: Confirms data appears in database

## Testing Results Log

- **test-supabase-connection.ps1**: Passed - API is reachable
- **test-post-to-supabase.ps1**: Initially failed with 401 (RLS issue)
- **Solution**: Used Service Role key to bypass RLS
- **test-final-verification.ps1**: Passed - Data saves correctly

## Notes

- The website uses Service Role key which bypasses RLS
- For production, consider using Supabase Edge Functions
- Check Supabase Table Editor to verify submissions