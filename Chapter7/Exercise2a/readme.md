# Exercise 2.a. – Stateless Container Example

```
$docker swarm init –advertise-addr <IP>
```


```
$ docker service create -p 80 --replicas 2 nginx:1.14.2
```

```
$docker service ls
``` 


```
$curl 192.168.0.223:3000
``` 

```
$docker service scale amazing_hellaman=5
$docker service ls
``` 

```
$docker service rm amazing_hellman
$docker service ls
``` 

