#! /bin/bash
# pull docker image
docker pull romangofer/site2:latest
# kill old running container (to clear host port)
#docker kill *
docker stop cheese
docker system prune -f

# pull image post prune
docker pull romangofer/site2:latest
# run new image
docker run -d --name cheese --rm -p 80:80 romangofer/site2:latest
