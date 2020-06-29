# Exercise 4.a Running a PostgreSQL Container with a Volume Example

```
$docker container run --name db1 -v db:/var/lib/postgresql/data -e POSTGRES_PASSWORD=password -d postgres
```

```
$ docker container exec -it db1 psql -U postgres
```

```
postgres=# CREATE TABLE People(NAME TEXT, age int);

postgres=# INSERT INTO PEOPLE VALUES('ENGY','41');

postgres=# SELECT * FROM PEOPLE;

postgres=# INSERT INTO PEOPLE VALUES('AREEJ','12');

postgres=# SELECT * FROM PEOPLE;
```


```
postgres=# \q
```

```
$ docker volume ls
```


```
$ docker container rm -fv db1

$ docker volume ls
```

```
$docker container run --name db2 -v db:/var/lib/postgresql/data -e POSTGRES_PASSWORD=password -d postgres
```

```
$ docker container exec -it db2 psql -U postgres

postgres=# SELECT * FROM PEOPLE;

postgres=#\q
```


```
$ docker container rm -f db2

$ docker volume rm db
```
