#!/bin/bash
set -e

IMAGE_NAME=${1:-devops-build}
TAG=${2:-$(git rev-parse --short HEAD)}

echo "Building $IMAGE_NAME:$TAG ..."
docker build -t "$IMAGE_NAME:$TAG" -t "$IMAGE_NAME:latest" .
echo "Build complete."
