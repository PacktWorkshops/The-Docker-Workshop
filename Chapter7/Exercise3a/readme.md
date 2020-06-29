# Exercise 3.a Volumes Outside the Container Scope

```
$docker volume create vol1
```


```
$docker volume ls
```


```
$docker volume inspect vol1
```

```
$ docker container run -it -v vol1:/container_vol --name container1 ubuntu:14.04 bash
```

```
root@71c638b18ef2:/# echo hello > /container_vol/new_file.txt
```


```
root@71c638b18ef2:/# ls /container_vol
```


```
root@71c638b18ef2:/# exit
```


```
$ sudo ls /var/lib/docker/volumes/vol1/_data
```


```
$ sudo cat /var/lib/docker/volumes/vol1/_data/new_file.txt
```


```
$docker container rm -v container1
```


```
$docker volume ls
```

```
$docker volume rm vol1
```

```
$docker volume ls
```
