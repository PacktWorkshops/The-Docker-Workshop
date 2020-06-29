# Exercise 6.a Saving a file on a volume and committing it to a new image


```
$docker container run --name c1 -v /newvol -it ubuntu:14.04 bash
root@755c6d128ce9:/# echo hello > /newvol/file.txt
root@755c6d128ce9:/# cd newvol
root@755c6d128ce9:/newvol# ls
root@755c6d128ce9:/newvol# cat file.txt
root@755c6d128ce9:/newvol# exit
```


```
$ docker container commit c1 newimage
```


```
$ docker image inspect newimage --format={{.ContainerConfig.Volumes}}
```

```
$ docker container run -it newimage
root@5259f3bbd41f:/# cd newvol
root@5259f3bbd41f:/newvol# ls
root@5259f3bbd41f:/newvol# exit
```
