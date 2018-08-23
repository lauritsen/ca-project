# Dockerfile for ca-project

# Adding base image to build this image on
FROM ubuntu:latest

# Copy files
ADD . /usr/src/ca

# Install python and pip
RUN apt-get update && apt-get install -y \
    python-pip 

# Install python dependencies
RUN pip install -r /usr/src/ca/requirements.txt

# Expose default port
EXPOSE 5000

# Add default command for this image / run the app
CMD [ "python", "/usr/src/ca/run.py" ]


