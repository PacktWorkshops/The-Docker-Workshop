**Exercise 5 Sharing volumes between containers**

In this exercise, we are going to see how to share volumes between volumes using the --volume-from. You will see why this type is ephemeral type of volumes.

1. Create a container, c1, with a volume that is not shared with the host. Save a file inside this volume. Then press the escape sequence, CTRL + P then CTRL + Q, so the container runs in detached mode in the background.
```
$docker container run -v /newvol --name c1 -it ubuntu:14.04 bash
root@01715bb6ac15:/# echo hello > /newvol/file1.txt
root@01715bb6ac15:/# cd newvol/
root@01715bb6ac15:/newvol# ls
root@01715bb6ac15:/newvol# read escape sequence
```
2. Create a second container that mounts c1’s volume using --volumes-from option. Verify that c2 can access file1.txt that we saved from inside c1. Then add another file file2.txt from inside c2.
```
$docker container run --name c2 --volumes-from c1 -it ubuntu:14.04 bash
root@4dce5004338c:/# cd newvol/
root@4dce5004338c:/newvol# ls
root@4dce5004338c:/newvol# echo hello2 > /newvol/file2.txt
root@4dce5004338c:/newvol# ls
root@4dce5004338c:/newvol# read escape sequence
```
3. Attach to c1 and check that it can see the two files. Then exit c1.
```
$ docker attach c1
root@01715bb6ac15:/newvol# 
root@01715bb6ac15:/newvol# ls
root@01715bb6ac15:/newvol# exit
```
4. List the volumes.
```
$ docker volume ls
```
5. Remove c1 with the -v option. Then list the volumes again. You will find that the volume has not been removed with c1 because c2 still uses it.
```
$ docker container rm -v c1
$ docker volume ls
```
6. Remove c2 with the -v option. The list the volumes. You will find that the volume list is empty now.
```
$ docker container rm -fv c2
$ docker volume ls
```
