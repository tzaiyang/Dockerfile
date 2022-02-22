
# Dockerfile collection

## Multi-Platform build.

```bash
cd $APP
docker buildx create --name mp-builder
docker buildx use mp-builder
docker buildx inspect --bootstrap
# build and push
docker buildx build --platform=linux/arm64,linux/amd64 -t $REGISTY:$TAG --push .
# pull specific arch image to local
docker pull $REGISTY:$TAG
```
