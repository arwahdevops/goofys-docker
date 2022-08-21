## Setup min.io credentials
- edit `credentials` on configs folder
- edit endpoint & bucket on Dockerfile
## Run docker container
- docker network create environment-development
- docker volume create backend-vol-development
- docker-compose up --build -d