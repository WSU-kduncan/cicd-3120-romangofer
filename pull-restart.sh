#! /bin/bash
# pull docker image
docker pull romangofer/ceg3120-mysite:latest
# kill old running container (to clear host port)
#docker kill *
docker stop cheese
docker system prune -f -a

# pull image post prune
docker pull romangofer/ceg3120-mysite:latest
# run new image
docker run -d --name cheese -p 80:80 romangofer/ceg3120-mysite:latest
