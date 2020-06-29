# Exercise 6.b Saving a file in the new image filesystem


```
$ docker container rm -f $(docker container ls -aq)
```

```
$ docker container run --name c1 -it ubuntu:14.04 bash
root@1587ee2ff1e4:/# mkdir new     
root@340678727ad5:/# cd new
root@340678727ad5:/new# echo hello > file.txt
root@340678727ad5:/new# cat file.txt
root@340678727ad5:/new# exit
```


```
$ docker container commit c1 newimage
```


```
$ docker container run -it newimage
root@011249d0df33:/# ls

root@011249d0df33:/# cd new
root@011249d0df33:/new# ls

root@011249d0df33:/new# cat file.txt

root@011249d0df33:/new#exit

```
