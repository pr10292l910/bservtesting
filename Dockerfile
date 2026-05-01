FROM ubuntu:22.04
RUN apt update && apt install -y wget curl tar python3
WORKDIR /app
RUN wget https://files.ballistica.net/bombsquad/builds/BombSquad_Server_Linux_x86_64_1.7.37.tar.gz && \
    tar -xzf BombSquad_Server_Linux_x86_64_1.7.37.tar.gz
RUN curl -SsL https://github.com/playit-cloud/playit-agent/releases/download/v0.15.26/playit-linux-amd64 -o playit && \
    chmod +x playit
COPY start.sh .
RUN chmod +x start.sh
CMD ["./start.sh"]
