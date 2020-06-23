**Exercise 2.b. – Stateful Container Example**

Now, we shall deploy a single stateful MySQL container. Follow the steps in [https://hub.docker.com/_/mysql](https://hub.docker.com/_/mysql)
in via stack deploy section. Select and copy the stack.yml file.

1. Use an editor to paste the stack.yml file. You can use the vi or nano Linux commands.
```
$vi stack.yml
```
Paste the code in stack.yml file in this folder.

2. Press ESC key in the keyboard. Then type a colon then letters wq to quit with saving the code, as in Figure 7.8.
```
:wq
``` 

3. To verify the file is saved correctly, use CAT Linux command.
```
$cat stack.yml
```
The file is displayed. If there is an error, repeat the previous steps starting by the vi command.

4. If the code is correct, deploy the YML file by docker stack deploy subcommand, as in Figure 7.9.
```
$docker stack deploy -c stack.yml mysql
``` 

5. To connect to the service, right click on the port 8080 at the top and open it in a new window, as in Figure 7.10.

6. To list the stacks, use the docker stack ls subcommand, as in Figure 7.11.
```
$docker stack ls
```
7. To remove the stack, use the docker stack rm subcommand, as in Figure 7.11.
```
$docker stack rm mysql
```
