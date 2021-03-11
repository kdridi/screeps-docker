# screeps-docker

```sh
git clone https://github.com/kdridi/screeps-docker.git
cd screeps-docker
git submodule update --init --recursive
```

YOUR_STEAM_KEY : https://steamcommunity.com/dev/apikey

```sh
docker build -t screeps .
docker container run --rm -it --name screeps -e STEAM_KEY=YOUR_STEAM_KEY -p 21025:21025 screeps
```
