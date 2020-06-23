**Exercise 4.b Running a PostgreSQL Container without a Volume Example**

In this exercise, we run a default PostgreSQL container without a database volume. Then remove the container and its anonymous volume. In comparison to Exercise 3.a, when list the volumes, the list will be empty this time, and the data disappeared because it was not shared on a volume using -v or --volume or --mount options. 

1. Run a PostgreSQL container without a volume. Name the container as db1. Then exec to db1, create a table and insert some values.
```
$ docker container run --name db1 -e POSTGRES_PASSWORD=password -d postgres

$ docker container exec -it db1 psql -U postgres

postgres=# CREATE TABLE PEOPLE(NAME TEXT, AGE INT);

postgres=# INSERT INTO PEOPLE VALUES('ENGY','41');

postgres=# INSERT INTO PEOPLE VALUES('AREEJ','12');

postgres=# SELECT * FROM PEOPLE;
 
postgres=# \q
```
2. List the volumes. Docker has created an anonymous volume for db1 container.
```
$ docker volume ls
```
3. Remove the container with its anonymous volume.
```
$ docker container rm -fv db1
```
4. List the volumes. The list is empty.
```
$docker volume ls
```
