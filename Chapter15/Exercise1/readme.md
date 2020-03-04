1) Create a file located at by /etc/docker/policies/authz.rego by running the following commands:

```
mkdir -p /etc/docker/policies
touch /etc/docker/policies/authz.rego
ls /etc/docker/policies
 ```

2) Open the file with an editor and insert the following data:

```
package docker.authz 

allow {
	input.Method = "GET"
}
```

You can cat the content into the file with the following command:
```
cat > /etc/docker/policies/authz.rego << EOF
package docker.authz 

allow {
    input.Method = "GET"
}
EOF
cat /etc/docker/policies/authz.rego
```


3) Install the plugin by running the following command in your terminal and write y when it prompts for permissions:
```
docker plugin install --alias opa-docker-authz:readonly \
openpolicyagent/opa-docker-authz-v2:0.5 \
opa-args="-policy-file /opa/policies/authz.rego"
```


4) Check for the installed plugins by the following command:
```
docker plugin ls
```


5) Edit the Docker daemon configuration at /etc/docker/daemon.json with the following edition:
```
{
    "authorization-plugins": ["opa-docker-authz:readonly"]
}
```

6) Reload the Docker daemon with the following command: 

```
sudo kill -HUP $(pidof dockerd)
```

7) Run the following listing command to check whether it is allowed:

```
docker ps
```

8) Run the following create container command to check whether it is permitted:

```
docker run ubuntu
```

9) Check for the logs of the Docker daemon for plugin related lines:

```
journalctl -u docker | grep plugin | grep "OPA policy decision"
```

10) Stop using the plugin by removing the authorization-plugins part from the /etc/docker/daemon.json and reload the Docker daemon similar to Step 6:

```
cat > /etc/docker/daemon.json << EOF
{}
EOF
cat /etc/docker/daemon.json
sudo kill -HUP $(pidof dockerd)
```

11) Disable and remove the plugin with the following commands:

```
docker plugin disable opa-docker-authz:readonly 
docker plugin rm opa-docker-authz:readonly  
```