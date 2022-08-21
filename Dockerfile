FROM python:3.9.4-alpine

RUN apk update && apk add curl fuse --no-cache

# install goofys s3 client
RUN wget https://github.com/kahing/goofys/releases/latest/download/goofys
RUN chmod +x goofys
RUN mv goofys /usr/local/bin/

# copy credentials
COPY configs/credentials /tmp/credentials

# create mount point directory
RUN mkdir -p /app/storage
RUN chmod -R 755 /app/storage

# set work directory
WORKDIR /app

# set env variables
ENV AWS_SHARED_CREDENTIALS_FILE='/tmp/credentials'

# install dependencies
COPY requirements.txt .
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt

# copy project
COPY . .
# Run the application & mount the bucket
CMD ["sh", "-c", "goofys -o allow_other --dir-mode=0755 --file-mode=0644 --endpoint=https://your-minio-domain.com yourbucket /app/storage && uvicorn app.main:app --host 0.0.0.0"]