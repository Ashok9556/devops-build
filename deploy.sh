#!/bin/bash
set -e

IMAGE=${1:?Usage: ./deploy.sh <image:tag>}
CONTAINER=devops-app

echo "Pulling $IMAGE ..."
docker pull "$IMAGE"

echo "Removing old container if present ..."
docker rm -f "$CONTAINER" 2>/dev/null || true

echo "Starting new container on port 80 ..."
docker run -d --name "$CONTAINER" -p 80:80 --restart unless-stopped "$IMAGE"

docker image prune -f
echo "Deployed: $IMAGE"
