**Exercise 1 Install Jenkins as a Container**

1. Run the following command:

```
docker run –d –p 8080:8080 –v /var/run/docker.sock:/var/run/docker.sock jenkinsci/blueocean
```
2. Connect to the Jenkins service in the browser at: [http://localhost:8080](http://localhost:8080)

If it gave an error that it can’t reach the docker daemon, add Jenkins to the docker group:
```
sudo groupadd docker
sudo usermod –aG docker jenkins
```
