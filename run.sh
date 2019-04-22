#!/bin/bash

PORT=50301
SERVER_NAME="CTF"
SERVER_DESCRIPTION="Vanilla CTF server"
RCON_PASSWORD="password"

docker run --rm -d -p $PORT:50301\tcp -p $PORT:$PORT\udp \
	-e NAME="$SERVER_NAME" -e DESCRIPTION="$SERVER_DESCRIPTION" -e RCON_PASSWORD="$RCON_PASSWORD" -e PORT="$PORT" \
	-v Security:/opt/KAG/Security --name kag harrisonmiller/kag-dedicatedserver:latest
