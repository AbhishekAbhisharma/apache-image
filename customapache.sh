#!/bin/bash
ls
# Build the Docker image
sudo docker build -t abc .
# Run a container in the background, mapping port 6000 on the host to port 80 in the container
sudo docker run -d -p 6000:80 abc
echo "done"
