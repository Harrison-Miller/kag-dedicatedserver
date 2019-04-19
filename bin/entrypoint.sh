#!/bin/bash

set -e

if [[ ! -f /opt/KAG/autoconfig.cfg ]]; then
	echo "Starting a server: $NAME"
	echo "$DESCRIPTION"
	echo "Gamemode: $GAMEMODE"
	echo "======================================="

	TCPR_ON="0"
	if [[ -n "$RCON_PASSWORD" ]]; then
	  TCPR_ON="1"
	fi

	cp /opt/KAG/autoconfig.cfg.tmpl /opt/KAG/autoconfig.cfg

	# replace all the variables in autoconfig.cfg
	sed -i "s/GAMEMODE/$GAMEMODE/g" /opt/KAG/autoconfig.cfg
	sed -i "s/NAME/$NAME/g" /opt/KAG/autoconfig.cfg
	sed -i "s/DESCRIPTION/$DESCRIPTION/g" /opt/KAG/autoconfig.cfg
	sed -i "s/MAX_PLAYERS/$MAX_PLAYERS/g" /opt/KAG/autoconfig.cfg
	sed -i "s/MAPCYCLE/$MAPCYCLE/g" /opt/KAG/autoconfig.cfg
	sed -i "s/SV_PASSWORD/$SV_PASSWORD/g" /opt/KAG/autoconfig.cfg
	sed -i "s/RCON_PASSWORD/$RCON_PASSWORD/g" /opt/KAG/autoconfig.cfg
fi

exec "$@"
