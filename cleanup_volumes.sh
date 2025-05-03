#!/bin/bash
set -e

docker --version

docker volume create my_temp_volume
docker run --name temp_container -v my_temp_volume:/data alpine echo "hello"
docker rm temp_container

docker volume ls

docker volume rm my_temp_volume || echo "Volume in use or already removed"

docker volume prune -f
