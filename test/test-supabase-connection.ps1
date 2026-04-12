$headers = @{
    'apikey' = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5b2FhbXV0ZXh3ZHRkcHhkbGxsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQ3NjkzOTgsImV4cCI6MjA5MDM0NTM5OH0.wpRJFuct14Et3cBVhcdHsDJuvTnB8AAvFPyb6vWZlNw'
    'Content-Type' = 'application/json'
    'Authorization' = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5b2FhbXV0ZXh3ZHRkcHhkbGxsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQ3NjkzOTgsImV4cCI6MjA5MDM0NTM5OH0.wpRJFuct14Et3cBVhcdHsDJuvTnB8AAvFPyb6vWZlNw'
}

$body = @{
    name = 'Test Name'
    email = 'test@example.com'
    company = 'Test Company'
    service = 'Speed to Lead'
    message = 'Test message'
} | ConvertTo-Json

try {
    $response = Invoke-WebRequest -Uri 'https://ryoaamutexwdtdpxdlll.supabase.co/rest/v1/contacts' -Method POST -Headers $headers -Body $body -UseBasicParsing
    Write-Host "SUCCESS - Status: $($response.StatusCode)"
    Write-Host $response.Content
} catch {
    Write-Host "ERROR: $($_.Exception.Message)"
    Write-Host "Response: $($_.Exception.Response.StatusCode.value__)"
}