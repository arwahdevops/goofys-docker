## Local setup
- pip install virtualenv
- active env
- pip install -r requirements.txt
## Run Fastapi
uvicorn app.main:app --host 0.0.0.0 --port 8081

http://localhost:8081/
## For production recomended
uvicorn app.main:app --host 0.0.0.0 --workers 4
## Run docker container
- docker network create environment-development
- docker volume create backend-vol-development
- docker-compose up --build -d