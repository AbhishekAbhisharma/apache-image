#!/bin/bash
ls
#Navigate to the directory containing your Dockerfile and application code
cd apache-image
ls
# Build the Docker image
sudo build -t abc .
# Run a container in the background, mapping port 6000 on the host to port 80 in the container
sudo run -d -p 6000:80 abc
# Tag the image
docker tag abc abhisheksharma9877/apache-image:abcd
# Login to Docker Hub
docker login -u $duser -p $dpassword
# Push the image to Docker Hub
docker push abhisheksharma9877/apache-image:abcd
