#!/bin/bash

# Servidor HTTP mínimo en puerto 10000 para que Render no mate el proceso
python3 -c "
import http.server, threading
class H(http.server.BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'BombSquad server running')
    def log_message(self, *args): pass
s = http.server.HTTPServer(('0.0.0.0', 10000), H)
threading.Thread(target=s.serve_forever, daemon=True).start()
" &

# Iniciar playit en segundo plano
./playit &

# Iniciar servidor BombSquad
cd BombSquad_Server_Linux_x86_64_1.7.62
./bombsquad_server
