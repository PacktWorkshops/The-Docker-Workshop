**Exercise 3.a Volumes Outside the Container Scope**

In this exercise, we create a volume that is not confined to a container.

1. Create a volume.
```
$docker volume create vol1
```

2. List all volumes.
```
$docker volume ls
```
3. Inspect the volume
```
$docker volume inspect vol1
```
The output so far looks as the following screenshot:
 
4. Mount the volume to a container and modify its contents from inside the container.
```
$ docker container run -it -v vol1:/container_vol --name container1 ubuntu:14.04 bash
```

5. The prompt changes indicating that we are now inside the container. 
Write the word hello in a file called new_file.txt onto the volume. 
The volume inside the container is called container_vol. Think of the volume as a shared folder. 
In this case, this volume is shared between the host and the container. From the host, the volume is called vol1.
```
root@71c638b18ef2:/# echo hello > /container_vol/new_file.txt
```

6. List the contents of the volume to verify that the file is saved.
```
root@71c638b18ef2:/# ls /container_vol
```
7. Exit the container.
```
root@71c638b18ef2:/# exit
```
8. Check the contents of the new file from the host.
```
$ sudo ls /var/lib/docker/volumes/vol1/_data
```
9. Verify that the word hello, as the contents of the file, is saved as well.
```
$ sudo cat /var/lib/docker/volumes/vol1/_data/new_file.txt
```
10. Remove the container with the -v option to remove any volumes that are created within the container scope.
```
$docker container rm -v container1
```
11. Verify that the volume still exists.
```
$docker volume ls
``
The volume, vol1, is listed indicating that the volume that was created outside the container, even by using the -v option, 
will not be removed when the container is removed.

12. Remove the volume.
```
$docker volume rm vol1
```
13. Verify that the volume is removed.
```
$docker volume ls
```
