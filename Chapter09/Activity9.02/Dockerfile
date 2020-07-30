FROM python:3.7
  
ENV PYTHONUNBUFFERED 1

RUN apt-get update; apt-get install postgresql-client -y

# create root directory for our project in the container
RUN mkdir /service
RUN mkdir /service/static

# Set the working directory to /service
WORKDIR /service

# Copy the current directory contents into the container at /service
ADD . /service/

ENV HOME=/service
ENV APP_HOME=/service
WORKDIR $APP_HOME

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

ENTRYPOINT ["./entrypoint.sh"]
