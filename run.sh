#!/bin/bash

SERVER_NAME="CTF"
SERVER_DESCRIPTION="Vanilla CTF server"
RCON_PASSWORD="password"

docker run --rm -d -p 50301:50301 \
	-e NAME="$SERVER_NAME" -e DESCRIPTION="$SERVER_DESCRIPTION" -e RCON_PASSWORD="$RCON_PASSWORD" \
	-v Security:/opt/KAG/Security harrisonmiller/kag-dedicatedserver:latest
