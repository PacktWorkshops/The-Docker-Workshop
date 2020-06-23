**Exercise 4.a Running a PostgreSQL Container with a Volume Example**

In this exercise, we run a PostgreSQL container with a database volume. Then remove the container and create another one. List the volumes and verify from the new container can still access the database data. Therefore, the data persists and outlived the first container. 

1. Run a PostgreSQL container with a volume. Name the container as db1.
```
$docker container run --name db1 -v db:/var/lib/postgresql/data -e POSTGRES_PASSWORD=password -d postgres
```
If you do not have the image locally, the docker will pull the image for you.

2. Exec to the container to be able to interact with the container. The shell will change to posgres=# to indicate that you are inside the container.
```
$ docker container exec -it db1 psql -U postgres
```
3. Create a table PEOPLE with two columns, NAME and AGE, and insert some values in it. Then verify that the values are inserted correctly using SQL command: SELECT * FROM PEOPLE. To do that, type the following SQL statements in sequence: 
```
postgres=# CREATE TABLE People(NAME TEXT, age int);

postgres=# INSERT INTO PEOPLE VALUES('ENGY','41');

postgres=# SELECT * FROM PEOPLE;

postgres=# INSERT INTO PEOPLE VALUES('AREEJ','12');

postgres=# SELECT * FROM PEOPLE;
```

4. Exit the container by typing \q to quit the database. The shell prompt will return.
```
postgres=# \q
```
5. Verify that our volume is a named one and not anonymous. 
```
$ docker volume ls
```
6. Remove container db1 even with the -v option. List the volumes. The list shows that the volume is still there and was not removed with the container.
```
$ docker container rm -fv db1

$ docker volume ls
```
The output so far looks as the following screenshot:

7. As in Step 1, create a new container called db2 and mounts volume db as well.
```
$docker container run --name db2 -v db:/var/lib/postgresql/data -e POSTGRES_PASSWORD=password -d postgres
```
8. Exec to db2 and verify that the data persists although db1 has been removed. Then quit the database.
```
$ docker container exec -it db2 psql -U postgres

postgres=# SELECT * FROM PEOPLE;

postgres=#\q
```
9. Remove container db2 and volume db.
```
$ docker container rm -f db2

$ docker volume rm db
```
