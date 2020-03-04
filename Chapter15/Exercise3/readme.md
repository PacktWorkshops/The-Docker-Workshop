1) Install the docker-volume-sshfs plugin by running the following command in your terminal:

```
docker plugin install --grant-all-permissions vieux/sshfs
```

2) Create a Docker container with SSH connection to provide volumes to other containers by running the following command:

```
docker run -d -p 2222:22 \
--name volume_provider \
rastasheep/ubuntu-sshd:14.04
```

3) Create a new volume named volume-over-ssh by running the following command:

```
docker volume create -d vieux/sshfs \
--name volume-over-ssh \
-o sshcmd=root@localhost:/tmp \
-o password=root \
-o port=2222
```

4) Create a new file and fill it in the volume from Step 3 by running the following command:

```
docker run --rm -v volume-over-ssh:/data busybox \
sh -c "touch /data/test.txt && echo 'Hello from Docker Workshop' >> /data/test.txt"
```

5) Check the contents of the file created in Step 4 by running the following command:
```
docker run --rm -v volume-over-ssh:/data busybox \
cat /data/test.txt
```

6) You can delete the volume by running the following command:

```
docker volume rm volume-over-ssh
```