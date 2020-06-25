# Exercise 2.b. Integrate GitHub and Jenkins

We installed Jenkins in a container from Exercise 1. In this exercise, we shall create a job in Jenkins ad configure it with GitHub link and its credentials. 
We shall check Jenkins’ Output Console to verify that it built the image. 
Finally, we shall modify the Dockerfile at GitHub and Jenkins will detect that and rebuild the image for us automatically. 

1. Go back to Jenkins in the browser. Click on Create a job. 
 
2. Enter an item name. Write any name then click on Freestyle Project. The click OK.
 

3. Six tabs will show up: General, Source Code Management, Build Triggers, Build Environment, Build, and Post-build Actions. 
In General Check Discard old builds. So, the old build does not eat your disk space. Jenkins will do the housekeeping for you as well.
 
4. Scroll down or click on the second tab. In Source Code Management, click Git. 
In Repository URL, enter: https://github.com/<your GitHub username>/hit_counter. 
If you do not have Git, check your plugins and download it from there. We shall talk about managing the plugins in Exercise 3.

5. In Build Triggers tab, check Poll SCM. This is where we specify to jenkins the frequency of doing the tests. 
If you enter five asterisks with spaces in between each asterisk and the other, this means that you want jenkins to perform the test every minute. 
If you enter it as H * * * *, this means the polling will be done every one hour. If you do it as H/15 * * * *, four asterisks only, the polling will be every 15 minutes.  
Click with your mouse outside the text box, if you entered the code correctly, Jenkins will show when it will execute the next job. Otherwise, it will display an error in red.
If you enter it as H * * * *, and click outside the text box, Jenkins will display that you want it to build the image every minute.
```
H/15 * * * *
```

6. We shall skip the Build Environment. Scroll more to the Build Tab. Click on Add build step. Select Execute Shell. 
 
7. A text box will be displayed. Write in Command:
```
docker build -t hit_counter .
```
Then click Save.
 
8. Upon saving, the following screen will show up.
 
9. Before doing anything further in Jenkins. Let us check the images that we currently have in our host. 
In a terminal, type docker images or docker image ls to list the images.
```
$docker images
``` 
If you have cleaned your lab before this chapter, you will have only the jenkinsci/blueocean image.

10. Get back to Jenkins. Click on Build now from the left menu.
 
11. Click on Back to Dashboard. The following screen will show up. On the left at the bottom, you will see the Build Queue and Build Executor Status. 
In the screen shot below, it shows that one build has started with #1 beside it.
 Now, there is no success or failure of the build yet. When the build is done, its status will be displayed there.

12. Now, two builds have succeeded. In Last Success, #2 is shown. Beside it there is a small arrow. Click on it, a drop down menu will show as the screenshot below. 
Select Console Output to check what Jenkins did automatically for us.
 
13. In the Console Output, you will find that Jenkins executed the docker build command we entered in the Build step at the project configuration. 
 
14. Scroll down in the Console Output to see the result of the execution. It will be as the screenshot below showing that the build succeeded. 
You will find the image ID and tag. 
 
15. Let us verify that from the terminal. Re-run docker images. 
```
docker images
```
You will find the image hit_counter has been created for you. 
Also, you will find python:3.7-alpine image because it is the base image in the Dockerfile. Jenkins pulled it automatically.
With this step, we are sure that Jenkins was able to pull the files from your GitHub.

16. Now let’s make any changes in the GitHub code. First, verify that you did not commit any changes to the code yet. 
Get back to Jenkins, scroll up, and click on Back to Project in the left menu at the top. Then click on Recent Changes.

17. Jenkins will display that there are no changes in any of the builds, as the figure below.
 
18. Go to GitHub and edit the Dockerfile by changing the base image’s tag to be alpine only instead of 3.7-alpine. 
So, the base image will be: python:alpine. To do that from the GitHub website, click on the file, then click on the pencil tool on the right. 
The file will be opened for editing for you. You can do the same from the terminal as we did before by editing the file using any text editor. 
Then run git add and git push commands.
```
$ git add Dockerfile
$ git commit -m "editing the Dockerfile"
$ git push -u destination master
```
 
19. When done, scroll down and commit your changes to GitHub.

 
20. Return back to jenkins. Remove hit_counter and python:3.7-alpine to make sure that Jenkins is not using previous local images. 
Normally, you do not need to do this extra step. This is merely to make you sure about what Jenkins does.
```
$ docker rmi hit_counter python:3.7-alpine
```
21. Click Build Now again to start a building job instantly. Refresh the Recent Changes page. It will display that there is a change occurred as the figure below.

22. If you clicked on it, it will forward you to the GitHub showing you the differences between the old code and the new code. 
Click back in the browser and let s check the console output to check the base image that Jenkins used.
At the bottom, again you will find that Jenkins built the image successfully. 

23. The last step, go to the terminal and check again the images. You will that the hit_counter and python:alpine in the list.
```
$ docker images
``` 

