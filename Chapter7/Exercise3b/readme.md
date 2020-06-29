# Exercise 3.b Volumes within the Container Scope

```
$docker container run -itd -v /newvol --name container2 ubuntu:14.04 bash
```

```
$ docker volume ls
```

```
$docker container rm -fv container2
```


```
$ docker volume ls
```
