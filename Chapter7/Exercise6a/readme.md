**Exercise 6.a Saving a file on a volume and committing it to a new image**

1. As we did in the previous section, create a new container with a volume. Then save some data in a file inside the volume.
```
$docker container run --name c1 -v /newvol -it ubuntu:14.04 bash
root@755c6d128ce9:/# echo hello > /newvol/file.txt
root@755c6d128ce9:/# cd newvol
root@755c6d128ce9:/newvol# ls
root@755c6d128ce9:/newvol# cat file.txt
root@755c6d128ce9:/newvol# exit
```
2. Commit this container to a new image called newimage.
```
$ docker container commit c1 newimage
```
3. Inspect the image to verify that the volume is engraved inside the image.
```
$ docker image inspect newimage --format={{.ContainerConfig.Volumes}}
```
4. Craft a container based on the newimage that we just created. Then try to list the files in the volumes and its data. You will find that the file and the word hello were not saved in the image. Then exit the container.
```
$ docker container run -it newimage
root@5259f3bbd41f:/# cd newvol
root@5259f3bbd41f:/newvol# ls
root@5259f3bbd41f:/newvol# exit
```
