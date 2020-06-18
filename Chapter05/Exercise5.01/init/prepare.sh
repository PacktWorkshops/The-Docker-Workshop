#!/usr/bin/env sh

rm /data/index.html
echo "<h1>Welcome from Docker Compose!</h1>" >> /data/index.html
echo "<img src='http://bit.ly/moby-logo' />" >> /data/index.html
