#!/bin/bash

# Iniciar playit en segundo plano (tunnel)
./playit &

# Iniciar servidor BombSquad
cd BombSquad_Server_Linux_x86_64_1.7.62
./bombsquad_server
