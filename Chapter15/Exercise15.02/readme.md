1) Initialize a Docker swarm if you have not enabled it before by running the following command in the terminal: 

```
docker swarm init
```

2) Install the Weave Net plugin by running the following command:

```
docker plugin install --grant-all-permissions \
store/weaveworks/net-plugin:2.5.2
```

3) Create a new network using the driver with the following command:

```
 docker network create  \
--driver=store/weaveworks/net-plugin:2.5.2  \
weave-custom-net
```

4) Create a 3-replica application with the following command:

```
docker service create --network=weave-custom-net \
--replicas=3 \
--name=workshop \
-p 80:80 \
onuryilmaz/hello-plain-text
```

5) Get the names of the containers by running the following command:

```
FIRST_CONTAINER=$(docker ps --format "{{.Names}}" |grep "workshop.1")
echo $FIRST_CONTAINER
SECOND_CONTAINER=$(docker ps --format "{{.Names}}" |grep "workshop.2")
echo $SECOND_CONTAINER
THIRD_CONTAINER=$(docker ps --format "{{.Names}}" |grep "workshop.3")
echo $THIRD_CONTAINER
```

6) Run the following command to connect from the first container to the second one:

```
docker exec -it $FIRST_CONTAINER sh -c "curl $SECOND_CONTAINER" 
```

7) Similar to Step 6, connect from the first container to the third one:

```
docker exec -it $FIRST_CONTAINER sh -c "curl $THIRD_CONTAINER" 
```

8) You can delete the application and network with the following commands:

```
docker service rm workshop
docker network rm weave-custom-net
```
