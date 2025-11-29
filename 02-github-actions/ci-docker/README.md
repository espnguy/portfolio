# GitHub Actions CI Pipeline with Docker

This project demonstrates a full CI pipeline that:
- Installs Python dependencies
- Runs automated tests
- Builds a Docker image
- Uploads the Docker image as a pipeline artifact

Technologies:
- GitHub Actions
- Docker
- Python

To build locally:

docker build -t ci-docker-app .
docker run -p 5000:5000 ci-docker-app
