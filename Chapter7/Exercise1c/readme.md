**Exercise 1.c. – Check Container Size On Disk**

In this exercise, we highlight the effects of state transition on data retention. So, let us check the container size on the disk. When we first craft a container, it has the same size as the base image with a top read/write layer. With every layer being added to the container, its size increases. In this exercise, we shall create a container that has ubuntu:14.04 as its base image; then, we shall update ad install wget on top of it.
1. In a terminal, type:
```
$docker container run -it --name testsize ubuntu:14.04
```
The prompt changes from the shell to inside the container.

2. In a second terminal, type:
```
$docker image ls
```
And check the size of ubuntu:14.04 image. The size of the image at typing this lesson is 188 MB. 

3. Now, check the size of the container by typing:
```
$docker container ls -s
```
Look for the testsize container. The size is 0 MB (virtual 188 MB). 
•	The size indicates the size of the thin read/write layer of the container only.
•		The virtual size indicates the size of the thin read/write layer and all the previous layers encapsulated in the container.
Hence, in our case, the thin layer equals to zero, and the virtual size equals the image size.

4. In the first terminal, type inside the container:
```
root@0457ab345622: apt-get update
```
5. When the container finishes updating, type:
```
root@0457ab345622: apt-get install -y wget
```
6. When it finishes installing wget on top of ubuntu:14.04, re-check the container’s size. In the second terminal, type:
```
$docker container ls -s
```
Now, the size of the testsize container is 27.8 Mb (virtual 216 MB). 

