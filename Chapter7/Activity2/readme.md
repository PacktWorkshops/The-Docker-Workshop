**Activity 2 Solution**

1. Verify that you do not have the folder: /var/mylogs on your host. Run the following command:
```
$cd /var/mylogs
```
2. Run a container based on Nginx image. Specify in the run command the path of the shared volumes on host and inside the container. Inside the container, the Nginx uses /var/log/nginx path for the log files. Specify the path on the host as /var/mylogs.
```
$docker container run -d -v /var/mylogs:/var/log/nginx nginx
``` 
The docker engine will pull the image automatically if you do not have it locally.

3. Go to the path of /var/mylogs. List all the files in that directory. You should find two files in there: the access.log and error.log. 
```
$cd /var/mylogs
$ls
```
 
4. (Optional) If no errors were generated, the two files will empty. You check the contents by using cat Linux command or by using tail Linux command. As we used the cat command before, let us use the tail command for this example.
```
$tail -f *.log
```
 

