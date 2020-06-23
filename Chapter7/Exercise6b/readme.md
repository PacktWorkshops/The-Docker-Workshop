**Exercise 6.b Saving a file in the new image filesystem**

1. Remove any container that we might have from previous labs. You can concatenate several docker commands to each other. 
```
$ docker container rm -f $(docker container ls -aq)
```
2. Create a new container without a volume. Then create a folder using mkdir command. Open it using cd command. Then save the word hello in a new file called file.txt. Then exit c1.
```
$ docker container run --name c1 -it ubuntu:14.04 bash
root@1587ee2ff1e4:/# mkdir new     
root@340678727ad5:/# cd new
root@340678727ad5:/new# echo hello > file.txt
root@340678727ad5:/new# cat file.txt
root@340678727ad5:/new# exit
```
3. Commit this container to a new image called newimage.
```
$ docker container commit c1 newimage
```
4. Craft a container based on the newimage that we just created. Then try to list the folders to verify that folder new exists. Open it and list the files inside it. You will find file.txt is saved this time. Use cat command to display the contents of file.txt. It will show that word hello is saved. 
```
$ docker container run -it newimage
root@011249d0df33:/# ls

root@011249d0df33:/# cd new
root@011249d0df33:/new# ls

root@011249d0df33:/new# cat file.txt

root@011249d0df33:/new#exit

```
