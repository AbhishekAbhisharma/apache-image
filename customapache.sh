#!/bin/bash
ls
# Specify the port number
port_to_check=6000
# Find the container ID of the running container on the specified port
container_id=$(docker ps -a --filter "publish=${port_to_check}:80" --format "{{.ID}}")
if [ -z "$container_id" ]; then
  echo "No container found running on port $port_to_check."
  exit 1
fi
# Stop the running container
docker stop "$container_id"

# Remove the stopped container
docker rm "$container_id"
echo "Container on port $port_to_check stopped and removed."

# Build the Docker image
sudo docker build -t abc .
# Run a container in the background, mapping port 6000 on the host to port 80 in the container
sudo docker run -d -p 9000:80 abc
echo "done"
