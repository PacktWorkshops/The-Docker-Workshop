set -ex

REGISTRY=dev.docker.local:5000
SERVICENAME=postgresql

GIT_VERSION=`git log -1 --format=%h`
echo "version: $GIT_VERSION "

docker build -t $REGISTRY/$SERVICENAME:$GIT_VERSION .

docker push $REGISTRY/$SERVICENAME:$GIT_VERSION
