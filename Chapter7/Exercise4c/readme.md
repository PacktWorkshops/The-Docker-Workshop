# Exercise 4.c Miscellaneous Useful Docker Commands Example


```
$docker system df
```


```
$docker system df -v
```
 
```
$docker container run --name db_with -v db:/var/lib/postgresql/data -e POSTGRES_PASSWORD=password -d postgres

$docker volume ls

$docker ps -a –filter volume=db
```


