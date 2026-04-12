import http.server
import socketserver
import os

PORT = 3000
DIRECTORY = os.path.dirname(os.path.abspath(__file__))

os.chdir(DIRECTORY)

Handler = http.server.SimpleHTTPRequestHandler

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print(f"\n  Soma Automations Website is LIVE!")
    print(f"  Open in browser: http://localhost:{PORT}\n")
    httpd.serve_forever()
