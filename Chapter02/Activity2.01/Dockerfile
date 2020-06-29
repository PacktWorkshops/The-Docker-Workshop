# Start with Ubuntu base image
FROM ubuntu:18.04

# Set labels
LABEL maintainer=sathsara
LABEL version=1.0 

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install Apache, PHP, and other packages
RUN apt-get update && \
    apt-get -y install apache2 \
    php \ 
    curl

# Copy all php files to the Docker image
COPY *.php /var/www/html

# Set working directory
WORKDIR /var/www/html

# Create health check
HEALTHCHECK --interval=5s --timeout=3s --retries=3 CMD curl -f http://localhost || exit 1

# Expose Apache
EXPOSE 80

# Start Apache
ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]
