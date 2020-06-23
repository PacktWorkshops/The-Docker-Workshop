**Exercise 3.b Volumes within the Container Scope**

You do not need to create the volume before running the container as the previous example. 
Docker will create an unamed volume for you automatically. 
Again, the volume will not be removed when the container is removed unless you specify the -v option in the docker container rm subcommand.

1. Create a container with an anonymous volume
```
$docker container run -itd -v /newvol --name container2 ubuntu:14.04 bash
```
2. List all the volumes. Observe that this time the VOLUME NAME is a number not a name. This type of volumes is called anonymous volumes and can be removed by adding the -v option to the docker container rm subcommand.
```
$ docker volume ls
```
The volume’s name this time is a long HEX digit number and not a name.

3. Remove the container with the volume this time. The -f option is to force removing the container since it is in detached mode and running in the background. Add to it the v option to be -fv to remove the volume as well. If this volume is not anonymous, and we named it, it will not be removed by this option and must use docker volume rm <volume name> to remove it.
```
$docker container rm -fv container2
```
4. Verify that the volume has been removed. Use docker volume ls subcommand, and the list will be empty.
```
$ docker volume ls
```
