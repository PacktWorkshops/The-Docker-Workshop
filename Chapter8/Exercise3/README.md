# Exercise 3 Integrate Jenkins and Docker Hub

In Exercise 3, we shall integrate Jenkins with Docker Hub and push that image to your repository there. 
By the end of Exercise 3, you will verify the success of that by checking your Docker Hub.
To do so, we need to install three plugins first.

1. Click on Manage Jenkins on the left menu.
 
2. Click on Plugin Manager on the right. Four tabs will show, as the figure below. Click o Avaiable Tab and select the following three plugins:
      1.	Docker
      2.	Docker-build-step
      3.	Cloudbees Docker Build and Publish.
 
3. Then click install without restart. After installation, check Restart Jenkins when installation is complete and no jobs are running.
 Jenkins will take few minutes to restart. Wait until it is done, and the dashboard is shown. Click on the project’s name.
 
4. Click on Configure in the left menu to modify the project configurations.
 
5. We shall modify only the Build Tab. Click on it and click on Add build step. A Larger menu than the one we saw in Exercise will show up. 
If you see in that menu: Docker Build and Publish, then your plugins were installed successfully. Click on Docker Build and Publish.
 
6. In Registry Credentials, click on Add. Then select Jenkins from the drop down menu.
 
7. A pop up box as the one below will show. Enter your Docker Hub username and password this time. Then click Add.
 
8. Now, in the Registry Credentials, click on the first drop down menu and select the one you entered in the previous step.  
Then in the Repository name, enter <your Docker Hub username>/<image name>, as in the example below. 
Remove the Execute Shell that we entered in the Exercise 2 by clicking on the Red X on the top right. 
Now, you will have only one Build step, which is Docker Build and Publish one. Click Save to save the new configurations. 

9. Click Build now again in the left menu and in the Build History on the bottom left, you can follow the progress bar of the image building. 
It will have the same name you specified in the Repository Name in the previous step. Now, there is no more docker build commands as we did in Exercise 2. 
Jenkins will add the docker build step by itself because we chose it from the plugins. 
If the image passed the building successfully, Jenkins will use your Docker Credentials and automatically connect to Docker Hub or any registry you specify in the 
Repository Name. Finally, Jenkins will push the new image automatically to your registry, which is your Docker Hub registry in this exercise.
 

10. Again, as a further check, while the image is being built and before it is done, go to the terminal and check the images you have. Because we cleaned our lab at the end of the last exercise, you should find only jenkinsci/blueocean image only.
```
$ docker images
``` 
11. Now, also, before the image is id done building, check your Docker Hub account. You will not find the hit_counter image yet.
 
12. When the job is successfully built, you can tell from the blue ball beside the image name. 
If it is a red ball, this means that there was an error. Now, click on the arrow beside the image name and select Console Output.
 
13. As the figure below, you will find that Jenkins built the image successfully and pushed it to your Docker Hub.
 
14. Go back to the terminal, and re-run docker images to list the images, you will find an image with <your Docker Hub Username>/hit_count.
```
$ docker images
``` 
15. In the browser, refresh Docker hub. You will find your image at the top pushed for you automatically.
 
