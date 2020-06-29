# Exercise 5 Sharing volumes between containers

```
$docker container run -v /newvol --name c1 -it ubuntu:14.04 bash
root@01715bb6ac15:/# echo hello > /newvol/file1.txt
root@01715bb6ac15:/# cd newvol/
root@01715bb6ac15:/newvol# ls
root@01715bb6ac15:/newvol# read escape sequence
```

```
$docker container run --name c2 --volumes-from c1 -it ubuntu:14.04 bash
root@4dce5004338c:/# cd newvol/
root@4dce5004338c:/newvol# ls
root@4dce5004338c:/newvol# echo hello2 > /newvol/file2.txt
root@4dce5004338c:/newvol# ls
root@4dce5004338c:/newvol# read escape sequence
```


```
$ docker attach c1
root@01715bb6ac15:/newvol# 
root@01715bb6ac15:/newvol# ls
root@01715bb6ac15:/newvol# exit
```

```
$ docker volume ls
```

```
$ docker container rm -v c1
$ docker volume ls
```

```
$ docker container rm -fv c2
$ docker volume ls
```
