#! /bin/bash
docker rm `docker ps -aq`
docker rmi -f `docker images -q`
rm .env
rm -rf ../data/
rm -rf ../output/