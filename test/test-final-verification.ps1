$headers = @{
    'apikey' = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5b2FhbXV0ZXh3ZHRkcHhkbGxsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQ3NjkzOTgsImV4cCI6MjA5MDM0NTM5OH0.wpRJFuct14Et3cBVhcdHsDJuvTnB8AAvFPyb6vWZlNw'
    'Authorization' = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5b2FhbXV0ZXh3ZHRkcHhkbGxsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQ3NjkzOTgsImV4cCI6MjA5MDM0NTM5OH0.wpRJFuct14Et3cBVhcdHsDJuvTnB8AAvFPyb6vWZlNw'
    'Content-Type' = 'application/json'
    'Prefer' = 'return=minimal'
}

$body = @{
    name = "Test User"
    email = "test@test.com"
    service = "Test Service"
    message = "Test message"
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri 'https://ryoaamutexwdtdpxdlll.supabase.co/rest/v1/contacts' -Method POST -Headers $headers -Body $body
    Write-Host "SUCCESS: Data posted"
} catch {
    Write-Host "ERROR: $($_.Exception.Message)"
}