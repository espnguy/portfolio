import time
import redis

r = redis.Redis(host='redis', port=6379)

print("Worker started...")

while True:
    job = r.brpop("jobs")
    print(f"Processed job: {job}")
    time.sleep(1)
