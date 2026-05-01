FROM python:3.13-slim-bookworm

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Crear machine-id requerido por BombSquad
RUN echo "abcdef1234567890abcdef1234567890" > /etc/machine-id

WORKDIR /app

# Descargar servidor BombSquad 1.7.62
RUN wget https://files.ballistica.net/bombsquad/builds/BombSquad_Server_Linux_x86_64_1.7.62.tar.gz && \
    tar -xzf BombSquad_Server_Linux_x86_64_1.7.62.tar.gz && \
    rm BombSquad_Server_Linux_x86_64_1.7.62.tar.gz

# Descargar playit-gg agent
RUN curl -SsL https://github.com/playit-cloud/playit-agent/releases/download/v0.15.26/playit-linux-amd64 -o playit && \
    chmod +x playit

RUN chmod +x BombSquad_Server_Linux_x86_64_1.7.62/bombsquad_server

EXPOSE 10000
EXPOSE 43210/udp

COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

CMD ["/app/start.sh"]
