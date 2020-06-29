# Activity 1 Solution

```
$ docker container rm -fv $(docker container ls -aq)
$docker image rm $(docker image ls)
$docker volume ls
```

```
$docker volume rm <volume names separated by spaces>
$docker network ls
```

```
$docker network rm <network names separated by spaces>
```

```
$docker run -d ubuntu:14.04
$docker volume create vol1
$docker network create net1
$docker container rm -fv <container ID>
$docker volume rm vol1
$docker network rm net1
```

```
$docker container run --name db1 -v db:/var/lib/postgresql/data -e POSTGRES_PASSWORD=password -d postgres
```

```
$ docker container exec -it db1 psql -U postgres
```

```
CREATE TABLE events (ID serial NOT NULL PRIMARY KEY, info json NOT NULL);
```

```
INSERT INTO events (info) VALUES ('{"status":"create","id":"43903b966123a7c491b50116b40827daa03da5d350f8fef2a690fc4024547ce2","from":"ubuntu:14.04","Type":"container","Action":"create","Actor":{"ID":"43903b966123a7c491b50116b40827daa03da5d350f8fef2a690fc4024547ce2","Attributes":{"image":"ubuntu:14.04","name":"upbeat_johnson"}},"scope":"local","time":1592516703,"timeNano":1592516703507582404}');
```

```
select * from events;
```

```
# SELECT * FROM events WHERE info ->> 'status' = 'pull';
```


```
# SELECT * FROM events WHERE info ->> 'status' = 'destroy';
```


```
#SELECT info ->> 'id' as id FROM events WHERE info ->> 'status' = 'destroy';
```
