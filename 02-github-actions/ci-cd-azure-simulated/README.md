# Azure CI/CD Pipeline (Simulated)

This project demonstrates a full CI/CD pipeline using GitHub Actions, modeling a real Azure deployment workflow without creating actual Azure resources.

## Pipeline Stages

1. Build Python application  
2. Install dependencies  
3. Run automated tests  
4. Build Docker image  
5. Upload Docker image as an artifact  
6. Simulated Azure deployment stage  
   - Shows what would happen in a real pipeline  
   - No ACR, no App Service, no cost  

## Why Simulated?

This approach allows demonstration of:
- Docker builds
- Automated testing
- Multi-stage GitHub Actions pipelines
- Container artifact management
- Azure deployment structure and logic

without incurring Azure costs.

## How to Run Locally

docker build -t simulated-app .
docker run -p 5000:5000 simulated-app
