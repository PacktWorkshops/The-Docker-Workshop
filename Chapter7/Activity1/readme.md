**Activity 1 Solution**

1. To remove all the objects in your host, run the following commands:
```
$ docker container rm -fv $(docker container ls -aq)
$docker image rm $(docker image ls)
$docker volume ls
```
Get the volume names, then run:
```
$docker volume rm <volume names separated by spaces>
$docker network ls
```
Get the network names, then run:
```
$docker network rm <network names separated by spaces>
```
2. To execute the mentioned sequence of events run the following commands:
```
$docker run -d ubuntu:14.04
$docker volume create vol1
$docker network create net1
$docker container rm -fv <container ID>
$docker volume rm vol1
$docker network rm net1
```
Click Ctrl + C in the docker events terminal to terminate it.

3.To understand the JSON output. You will find that there are different attributes and structure depending upon the object. Check the following two examples:
Example 1:
```
{"status":"create","id":"43903b966123a7c491b50116b40827daa03da5d350f8fef2a690fc4024547ce2","from":"ubuntu:14.04","Type":"container","Action":"create","Actor":{"ID":"43903b966123a7c491b50116b40827daa03da5d350f8fef2a690fc4024547ce2","Attributes":{"image":"ubuntu:14.04","name":"upbeat_johnson"}},"scope":"local","time":1592516703,"timeNano":1592516703507582404}
```
Example 2:
```
{"Type":"network","Action":"connect","Actor":{"ID":"52855e15618e37b7ecc0bb26bc42847af07cae65ddd3b68a029e40006364a9bd","Attributes":{"container":"43903b966123a7c491b50116b40827daa03da5d350f8fef2a690fc4024547ce2","name":"bridge","type":"bridge"}},"scope":"local","time":1592516703,"timeNano":1592516703911851347}
```
Let us scrutinize the first example. You will that there are key and values and all are separated by colons.

Status: status of the container
Id: <container 64-HEX ID>
From: base image
Type: container
Action: status of the container
Actor: {ID: <container 64-HEX ID>
           Attributes: {image: <image name>
          Name: <container auto-generated name as adjective_noun>}}
Scope: local or swarm
Time and timeNano for time stamp.

4. Copy all the docker events output from the first terminal.

5. Run a Postgres container with a volume. Name the container as db1.
```
$docker container run --name db1 -v db:/var/lib/postgresql/data -e POSTGRES_PASSWORD=password -d postgres
```
6. Exec to the container to be able to interact with the container. The shell will change to posgres=# to indicate that you are inside the container.
```
$ docker container exec -it db1 psql -U postgres
```
7. Create a table of two columns. One column is a serial ID and the other column is a the JSON data.
```
CREATE TABLE events (ID serial NOT NULL PRIMARY KEY, info json NOT NULL);
```
8. Insert first row of the JSON output from the first example that .
```
INSERT INTO events (info) VALUES ('{"status":"create","id":"43903b966123a7c491b50116b40827daa03da5d350f8fef2a690fc4024547ce2","from":"ubuntu:14.04","Type":"container","Action":"create","Actor":{"ID":"43903b966123a7c491b50116b40827daa03da5d350f8fef2a690fc4024547ce2","Attributes":{"image":"ubuntu:14.04","name":"upbeat_johnson"}},"scope":"local","time":1592516703,"timeNano":1592516703507582404}');
```
9. Verify that the row is saved in the database, by typing the following SQL statement:
```
select * from events;
```

10. Insert multiple rows at the same time as [events.txt](https://github.com/PacktWorkshops/The-Docker-Workshop/blob/master/Chapter7/Activity1/events.txt) file in this folder.
It is clear that eleven event has been inserted successfully in the Postgres.

11. Run the three queries one by one.
11.a.
```
# SELECT * FROM events WHERE info ->> 'status' = 'pull';
```

10.b.
```
# SELECT * FROM events WHERE info ->> 'status' = 'destroy';
```

10.c.
```
#SELECT info ->> 'id' as id FROM events WHERE info ->> 'status' = 'destroy';
```
