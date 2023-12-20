#!/bin/bash
ls
# Specify the port number
port=9000
# Find the container ID of the running container on the specified port
EXISTING_CONTAINER=$(docker ps -q -f "publish=${PORT}")

if [ -n "${EXISTING_CONTAINER}" ]; then
    # If a container is running, stop and remove it
    docker stop ${EXISTING_CONTAINER}
    docker rm ${EXISTING_CONTAINER}
    echo "Existing container stopped and removed"
fi

# Build the Docker image
sudo docker build -t abc .
# Run a container in the background, mapping port 6000 on the host to port 80 in the container
sudo docker run -d -p 9000:80 abc
echo "done"
