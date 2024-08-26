# OpenVSCode Server releases

This repo is only to produce releases for [OpenVSCode Server](https://github.com/gitpod-io/openvscode-server).

### Build
```
docker buildx build --build-arg RELEASE_TAG=openvscode-server-v1.92.1 --no-cache --load -t yajithd/openvscode-server:1.92.1 .
```

### Run
```
docker run -it --init -p 3000:3000 -v "$(pwd):/home/workspace:cached" yajithd/openvscode-server:1.92.1
```