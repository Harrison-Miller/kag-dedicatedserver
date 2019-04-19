# Running
Create a script to start the docker container with the correct parameters

docker run --rm -d -p 50301:50301 harrisonmiller/kag-dedicatedserver:latest

You can copy the example script run.sh and the Security folder.
The security folder contains the Official KAG Server Admin Seclev.
You should also add your own name to the superadmin.cfg

# Configuration
Use the environment variables as needed to configure the basics of your server

docker run --rm -d -p 50301:50301 -e NAME="Verra's CTF" \
	-e DESCRIPTION="Vanilla CTF server hosted by Verra" harrisonmiller/kag-dedicatedserver:latest

Additional environment variables and their defaults
```
GAMEMODE="CTF"
NAME="Default Server"
DESCRIPTION=""
MAX_PLAYERS=20
MAPCYCLE=""
SV_PASSWORD=""
RCON_PASSWORD=""
```

# Advanced

## Mods
In the same directory as your startup script create a Mods folder and install your mods there. Then make your mods.cfg file

Then add `-v ./Mods:/opt/KAG/Mods -v ./mods.cfg:/opt/KAG/mods.cfg` to your command.

## Security
Create a Security directory in the same location as your startup script then add
`-v ./Security:/opt/KAG/Security` to your command.

## autoconfig
If you need to change the autoconfig beyond what the environment variables can do, you can create an autoconfig.cfg file in the same location as your script.

`-v ./autoconfig.cfg:/opt/KAG/autoconfig.cfg`
