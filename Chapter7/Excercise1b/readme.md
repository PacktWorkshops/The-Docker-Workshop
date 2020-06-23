**Exercise 1.b. – Docker Container State: CREATED**

Now, we have seen all the various statuses of the container except CREATED. Usually, we do not see the CREATED status
 because the main process runs. 
1. To see the CREATED status, we shall run a command that generates an error. The container cannot get UP and running. 
```
$docker container run --name testcreate ubuntu:14.04 time
```
2.List the running containers.
```
$docker container ls
```
The list is empty.
3.List all the containers by adding the -a option.
```
$docker container ls -a
```
Look in the list for the container with name testcreate; its status is CREATED.
