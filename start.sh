#!/bin/bash
# 1. Web falsa para que Render no nos apague
python3 -m http.server $PORT &

# 2. Iniciar el juego en segundo plano
cd BombSquad_Server_Linux_x86_64_1.7.37
./bombsquad_server &
cd ..

# 3. Iniciar Playit para el multijugador
./playit
