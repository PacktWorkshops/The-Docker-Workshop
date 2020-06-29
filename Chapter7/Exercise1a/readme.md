
```
$ docker container rm -f $(docker container ls -aq)
$ docker image rm $(docker image ls)
```
# Exercise 1.a. – Docker Container States

```
$docker container run --name testevents ubuntu:14.04 ping google.com
```


```
$docker container ls
```

```
$docker container pause testevents
```

```
$docker container ls
```

```
$docker container unpause testevents
```

```
$docker container ls
```

```
$docker container stop testevents
```

```
$docker container ls
```

```
$docker container ls -a
```

```
$docker container start -a testevents
```

```
$docker container ls
```

```
$docker container rm -f testevents
```

```
$docker container ls -a
```

