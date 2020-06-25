# Exercise 2.a. Upload the code to your GitHub

On the GitHub website, create a new empty repository with name hit_counter. In this exercise, you will learn how to download and upload the code from GitHub. You can do that by forking the code at GitHub website. However, for this exercise, we shall do it from the command prompt instead because you need to learn how to push your code. 

1. Open a terminal and clone the code by typing the following command:
```
$ git clone https://github.com/efoda/hit_counter
``` 
2. Verify that the code is downloaded to your local machine by listing the directories. Then open the application directory.
```
$ cd hit_counter
~/hit_counter$ ls
```
You will find the application files downloaded to your local machine.

3. Initialize and configure the git. Enter your username and email below.
```
$ git init
$ git config user.email "<you@example.com>"
$ git config user.name "<Your Name>"
```
4.Specify the names of the git accounts. For this exercise, we named them origin and destination. 
```
$ git remote add origin https://github.com/efoda/hit_counter.git
$ git remote add destination https://github.com/<your Github Username>/hit_counter.git
```
5. Add all the contents in the current path.
```
$ git add .
```
You can add for upload specific file instead of all the files by typing :
$ git add <filename>.<extension>

6. Specify a commit message. Push the code to your GitHub account. 
```
$ git commit -m "first commit"
$ git push -u destination master
```
It will ask you for our username and password. When login succeeds, the files will be uploaded to your GitHub repo.     
 
7. Check your GitHub account. You will find the files have been uploaded there.
