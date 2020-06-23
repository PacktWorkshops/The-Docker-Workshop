**Exercise 4.c Miscellaneous Useful Docker commands Example**

1. To know the size of all the docker objects in your system, run docker system df command. It shows the docker disk usage.
```
$docker system df
```

2. To get a more detailed information, add the -v option to the docker system df command.
```
$docker system df -v
```
 
3. To know which container uses which volume, run docker volume ls subcommand to list all the volumes that you have on your system. 
Copy the Volume Name that you want to know which container uses it. Then run docker ps -a --filter volume=<Volume Name>. In the output, NAMES will show the container name.
```
$docker container run --name db_with -v db:/var/lib/postgresql/data -e POSTGRES_PASSWORD=password -d postgres

$docker volume ls

$docker ps -a –filter volume=db
```


