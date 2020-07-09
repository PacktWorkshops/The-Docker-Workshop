set -ex

USER=<your_user_name>
SERVICENAME=basic-app

version=`cat VERSION`
echo "version: $version"

docker build -t $USER/$SERVICENAME:$version .
