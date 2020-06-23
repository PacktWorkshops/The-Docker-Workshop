**Exercise 2.a. – Stateless Container Example**

In this example, we shall create a stateless service, Nginx, on a swarm and scale it using Docker Playground. 
You connect to the Docker Playground at: [https://labs.play-with-docker.com/](https://labs.play-with-docker.com/), as in Figure 7.2.
 
1. Click on ADD NEW INSTANCE on the left menu. Then get the node IP from the top node information. Now, create a swarm by typing: 
```
$docker swarm init –advertise-addr <IP>
```
2. Then to create a service, type:
```
$ docker service create -p 80 --replicas 2 nginx:1.14.2
```
The docker service create command creates two replica services from nginx:1.14.2 image at port 80 inside the container. 
The docker daemon chooses any available host port. In this case, it chooses port 30000, as shown at the top in Figure 7.2. 

3. To verify the service, type the following command, as shown in Figure 7.3:
```
$docker service ls
``` 

As shown in Figure 7.3, the docker daemon auto-generated a service ID and a nickname to the service as amazing_hellman 
because we did not specify one using the --name option. As in container, the docker daemon assigns a random adjective_noun format. 

4. To see the output of the service and connect to it without using a browser, 
we use the curl <IP:Port Number> Linux command, as in Figure 7.4. 
The output is an HTML page showing that the default welcome page of the Nginx indicating that it has been installed correctly.
```
$curl 192.168.0.223:3000
``` 

5. Assume that the business is booming and two replicas are not enough, 
and we need to scale it to five replicas instead of two, as in Figure 7.5. To do that, 
we use docker service scale <service name>=<number of replicas> subcommand. 
To verify that the docker swarm replicated the service for us, use docker service ls subcommand one more time. 
The output shows that the number of replicas increased from 2 to 5 replicas.
```
$docker service scale amazing_hellaman=5
$docker service ls
``` 

6. To delete this service, we use docker service rm <service nickname> subcommand, as in Figure 7.6. 
To verify that the service has been deleted, list the service one more time using docker service ls subcommand. 
The output is an empty list.
```
$docker service rm amazing_hellman
$docker service ls
``` 

