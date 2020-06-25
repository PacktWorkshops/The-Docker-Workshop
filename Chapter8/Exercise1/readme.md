# Exercise 1 Install Jenkins as a Container

For this exercise and the rest of this chapter’s exercises and activity, we need to install Jenkins, finish its setup, and install the preliminary plugins. 

1. Run the following command:
```
$docker run -d -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock jenkinsci/blueocean
```
 
Note
There are many Jenkins images on Docker Hub, feel free to pull any of them and play with the ports and shared volume. However, pay attention to the deprecated images as Jenkins official image is now deprecated for Jenkins/Jenkins:lts image. Therefore, read the documentation of the images carefully. However, do not worry if one does not work, it might not be your mistake, look for another and follow the instructions of the documentation carefully.

2. Connect to the Jenkins service in the browser at: [http://localhost:8080]( http://localhost:8080)
If it gives you an error that it cannot reach the docker daemon, add Jenkins to the docker group:

```
$ sudo groupadd docker
$ sudo usermod –aG docker jenkins
```
If your machine’s operating system is windows, the localhost might not be resolved. Run ipconfig command in Windows PowerShell. In the second section of the output, ipconfig displays the information of the switch, copy the Ipv4 address, as in Figure 8.2 and use it instead of localhost throughout the exercises.
```
>ipconfig
``` 

You can also get the IP address from the Control Panel -- > the Network Settings. Click on Details of your Ethernet or Wi-Fi connection, as in Figure 8.2.
 
3. In the browser, after Jenkins finishes installation, it will ask for an Initialization Admin Password to unlock it. 

4. The password is already auto-generated for you. Run docker container ls to the current running containers and find the one that is crafted from the jekinsci/blueocean image. Copy the container ID and run docker logs <container ID>. 
```
$ docker container ls
$ docker logs <container ID>
```
  
5. At the end of the log file, you will find six lines of asterisks. The password will be in between them. Copy it and paste it in the browser.  

6. Select Install suggested plugins. Then click skip and continue as admin. Then click save and finish.
 
In the suggested plugins, there are GIT and GITHUB plugins that Jenkins will install automatically for you. We need these plugins for all the coming exercises. In exercise 3, we shall need to install further plugins, so Jenkins can push the image to the Docker Hub Registry. We shall talk about that in details and how to manage Jenkins Plugins in a step-by-step lab.

7. After finishing, it will display that Jenkins is ready. Click on Start using Jenkins.
 
8. Click on Create a job.
 
Now, you installed Jenkins successfully and good to go. Congratulations! 
