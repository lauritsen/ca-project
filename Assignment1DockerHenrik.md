# Assignment 1 Docker 

Code can be found here: [https://github.com/lauritsen/docker-assignment](https://github.com/lauritsen/docker-assignment)

## The gay border TOIlet

Build file is found on the repo and pasted here.

```
# Dockerfile for The gay border TOIlet application

# Add a base image to build this image of
FROM ubuntu:18.04

# Install curl
RUN apt-get update && apt-get install -y curl

# Download image and extract files
RUN curl -o toilet-0.3.tar.gz http://caca.zoy.org/raw-attachment/wiki/toilet/toilet-0.3.tar.gz
RUN tar xzf toilet-0.3.tar.gz

# Install toilet
RUN apt-get install -y toilet

# Run command
CMD ["toilet", "-F", "border", "--gay"]
```


Link to docker hub: [https://hub.docker.com/r/henriklauritsen/toilet/](https://hub.docker.com/r/henriklauritsen/toilet/)



## Wordpress with proxy

Code is available at the repo linked above.

### Describe what kind of commands you would use to delete the containers and create new ones

* `docker-compose up -d` is used to create the containers. -d is for detached mode.
* `docker-compose down` is used to delete the containers.
* `docker system prune` can be used to clean up

### Describe where you would define what exact version of mysql docker should use?

The mysql version is defined right after the image name (mysql):

```
services:
  db:
    :image: mysql:<version>
```

### What commands will give you the ip addresses of the containers in the described network

1. Use `docker network ls` to list networks
2. Use `docker inspect <network-name>` to find ip adresses for the containers in the network.