#!/bin/bash
ls
#Navigate to the directory containing your Dockerfile and application code
cd apache-image
ls
# Build the Docker image
sudo build -t abc .
# Run a container in the background, mapping port 6000 on the host to port 80 in the container
sudo run -d -p 6000:80 abc
echo "done"
