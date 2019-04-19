#!/bin/bash

SERVER_NAME="CTF"
SERVER_DESCRIPTION="Vanilla CTF server"

docker run --rm -d -p 50301:50301 \
	-e NAME=$SERVER_NAME -e DESCRIPTION=$SERVER_DESCRIPTION \
	-v ./Security:/opt/KAG/Security harrisonmiller:kag-dedicatedserver.sh
