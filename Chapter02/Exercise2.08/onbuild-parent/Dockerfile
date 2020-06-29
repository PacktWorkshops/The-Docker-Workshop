# ONBUILD example
FROM ubuntu
RUN apt-get update && apt-get install apache2 -y 
ONBUILD COPY *.html /var/www/html
EXPOSE 80
ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]
