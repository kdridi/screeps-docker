#!/usr/bin/env bash

set -e

case $1 in
	start)
        if [[ "$STEAM_KEY" = "" ]]; then
            echo "https://steamcommunity.com/dev/apikey"
            echo "docker container run --rm -it --name screeps -e STEAM_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX -p 21025:21025 kdridi/screeps"
            exit 84
        else
            echo "$STEAM_KEY" | node bin/screeps.js init
            node bin/screeps.js start
        fi
		;;
	*)
		echo "$@"
		;;
esac
