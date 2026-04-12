$headers = @{
    'apikey' = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5b2FhbXV0ZXh3ZHRkcHhkbGxsIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3NDc2OTM5OCwiZXhwIjoyMDkwMzQ1Mzk4fQ.xiyZi3gHE1KvrBMTGnmVySrYEQyGUJJs6wpMjqufyJk'
    'Content-Type' = 'application/json'
    'Authorization' = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5b2FhbXV0ZXh3ZHRkcHhkbGxsIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc3NDc2OTM5OCwiZXhwIjoyMDkwMzQ1Mzk4fQ.xiyZi3gHE1KvrBMTGnmVySrYEQyGUJJs6wpMjqufyJk'
}

$body = @{
    name = 'Test User'
    email = 'test@supabase.com'
    company = 'Test Company'
    service = 'Speed to Lead'
    message = 'Testing with service role key'
} | ConvertTo-Json

try {
    $response = Invoke-WebRequest -Uri 'https://ryoaamutexwdtdpxdlll.supabase.co/rest/v1/contacts' -Method POST -Headers $headers -Body $body -UseBasicParsing
    Write-Host "SUCCESS! Status: $($response.StatusCode)"
} catch {
    Write-Host "ERROR: $($_.Exception.Message)"
}