# Docker Compose Multi-Service Example

This project demonstrates a simple microservice architecture using Docker Compose.  
It consists of:

- Flask web application (`web`)
- Worker service processing queued jobs (`worker`)
- Redis message broker (`redis`)

## How to Run

Inside this folder:

docker compose up --build

Then open:

http://localhost:5000

Queue a job:

http://localhost:5000/enqueue?job=test1

You will see the worker process the job in its logs.

## Services

### web
Small Flask API that enqueues jobs via Redis.

### worker
Background processor that listens for jobs and handles them.

### redis
In-memory message broker used to move tasks between services.

## Shut Down

docker compose down
