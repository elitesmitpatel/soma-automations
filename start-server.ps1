$html = Get-Content -Path "C:\Users\swikr\Documents\opencode\soma-automations\index.html" -Raw

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:3000/")
$listener.Start()

Write-Host ""
Write-Host "  ╔══════════════════════════════════════════╗"
Write-Host "  ║   Soma Automations Website is LIVE!      ║"
Write-Host "  ║   Local:   http://localhost:3000         ║"
Write-Host "  ╚══════════════════════════════════════════╝"
Write-Host ""

while ($listener.IsListening) {
    $context = $listener.GetContext()
    $response = $context.Response
    $buffer = [System.Text.Encoding]::UTF8.GetBytes($html)
    $response.ContentLength64 = $buffer.Length
    $response.ContentType = "text/html; charset=utf-8"
    $response.OutputStream.Write($buffer, 0, $buffer.Length)
    $response.OutputStream.Close()
}
