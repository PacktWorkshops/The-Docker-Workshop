To delete the containers and images from previous chapters:
```
$ docker container rm -f $(docker container ls -aq)
$ docker image rm $(docker image ls)
```
*****Exercise 1.a. – Docker Container States*****

In this exercise, we transit through all the states for a Docker container except the CREATE one, which we shall see in the next section of this exercise, Exercise 1.b.
1. Open a terminal and run the following command:
```
$docker container run --name testevents ubuntu:14.04 ping google.com
```
2. In another terminal, execute the following command:
```
$docker container ls
```
Look for the container with the name “testevents,” the status should be UP.
3. In the second terminal, type:
```
$docker container pause testevents
```
In the first terminal, the pinging has stopped.
4. In the second terminal, type:
```
$docker container ls
```
The status of testevents is UP (PAUSED).
5. In the second terminal, type:
```
$docker container unpause testevents
```
The pinging resumes in the first terminal, and new packets are transmitted.
6. In the second terminal, type:
```
$docker container ls
```
The testevents container status is UP.
7. Now, type:
```
$docker container stop testevents
```
In the first terminal, the container exits, and the shell prompt returns.
8. In any terminal, type:
```
$docker container ls
```
The testevents container is not in the list anymore because docker container ls subcommand displays the up and running containers only. 
9. To display all the containers, type:
```
$docker container ls -a
```
The status of testevents container now is EXITED.
10. In the first terminal, type:
```
$docker container start -a testevents
```
The pinging command is resumed and executed in the first terminal.
11. In the second container, type:
```
$docker container ls
```
The testevents returns back to the list, and its status is UP and running. 
12. In the second terminal, type:
```
$docker container rm -f testevents
```
The -f option is to force removing the container because it is up and running. The first terminal stops executing the ping command.
13. Our last command, in any terminal, type:
```
$docker container ls -a
```
You cannot find testevents container in the list or anywhere because we just removed it from our system.
