1) Create a network with the following command:
```
docker network create  \
--driver=store/weaveworks/net-plugin:2.5.2 \
--attachable \
wp-network
```

2) Create a volume with the following command:
```
docker volume create -d vieux/sshfs \
--name wp-content \
-o sshcmd=root@localhost:/tmp \
-o password=root \
-o port=2222
```

3) Create the mysql container with the following command:
```
docker run --name mysql -d \
-e MYSQL_ROOT_PASSWORD=wordpress \
-e MYSQL_DATABASE=wordpress \
-e MYSQL_USER=wordpress \
-e MYSQL_PASSWORD=wordpress \
--network=wp-network \
mysql:5.7
```

4) Create the wordpress container with the following command:
```
docker run --name wordpress -d \
-v wp-content:/var/www/html/wp-content \
-e WORDPRESS_DB_HOST=mysql:3306 \
-e WORDPRESS_DB_USER=wordpress \
-e WORDPRESS_DB_PASSWORD=wordpress \
-e WORDPRESS_DB_NAME=wordpress \
--network=wp-network \
-p 8080:80 \
wordpress
```