from flask import Flask, request
import redis

app = Flask(__name__)
r = redis.Redis(host='redis', port=6379)

@app.route("/")
def home():
    return "Docker Compose Example: Web + Worker + Redis"

@app.route("/enqueue")
def enqueue():
    job = request.args.get("job", "default-job")
    r.lpush("jobs", job)
    return f"Job '{job}' queued!"
