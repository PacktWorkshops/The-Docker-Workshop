# Exercise 4.b Running a PostgreSQL Container without a Volume Example

```
$ docker container run --name db1 -e POSTGRES_PASSWORD=password -d postgres

$ docker container exec -it db1 psql -U postgres

postgres=# CREATE TABLE PEOPLE(NAME TEXT, AGE INT);

postgres=# INSERT INTO PEOPLE VALUES('ENGY','41');

postgres=# INSERT INTO PEOPLE VALUES('AREEJ','12');

postgres=# SELECT * FROM PEOPLE;
 
postgres=# \q
```

```
$ docker volume ls
```

```
$ docker container rm -fv db1
```

```
$docker volume ls
```
