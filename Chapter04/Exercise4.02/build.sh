#!/bin/sh

echo "Creating welcome builder image"

docker image build -t welcome-builder:v1 -f Dockerfile.build .

docker container create --name welcome-builder-container welcome-builder:v1

docker container cp welcome-builder-container:/myapp/welcome .

docker container rm -f welcome-builder-container

echo "Creating welcome runtime image"

docker image build -t welcome-runtime:v1 .

rm welcome
