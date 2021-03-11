# screeps-docker

YOUR_STEAM_KEY : https://steamcommunity.com/dev/apikey

```sh
docker build -t screeps .
docker container run --rm -it --name screeps -e STEAM_KEY=YOUR_STEAM_KEY -p 21025:21025 screeps
```
