$headers = @{
    'apikey' = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5b2FhbXV0ZXh3ZHRkcHhkbGxsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQ3NjkzOTgsImV4cCI6MjA5MDM0NTM5OH0.wpRJFuct14Et3cBVhcdHsDJuvTnB8AAvFPyb6vWZlNw'
    'Content-Type' = 'application/json'
    'Authorization' = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ5b2FhbXV0ZXh3ZHRkcHhkbGxsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQ3NjkzOTgsImV4cCI6MjA5MDM0NTM5OH0.wpRJFuct14Et3cBVhcdHsDJuvTnB8AAvFPyb6vWZlNw'
}

$sql = @"
CREATE POLICY "Allow all inserts for anon" ON contacts
FOR INSERT TO anon
WITH CHECK (true);
"@

$body = @{
    query = $sql
} | ConvertTo-Json

try {
    $response = Invoke-WebRequest -Uri 'https://ryoaamutexwdtdpxdlll.supabase.co/rest/v1/rpc/run_sql' -Method POST -Headers $headers -Body $body -UseBasicParsing
    Write-Host "Policy created - Status: $($response.StatusCode)"
} catch {
    Write-Host "Error creating policy: $($_.Exception.Message)"
}