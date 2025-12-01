# Flask Web Helm Chart

This Helm chart deploys a simple Flask web application to Kubernetes.

## Features

- Deployment configuration
- ClusterIP Service
- Optional Ingress
- Configurable image repository and tag
- Custom replica count
- Standard Helm chart structure

## Install the chart (hypothetical)

helm install webapp ./flask-web-chart

## Customize values

helm install webapp ./flask-web-chart
--set image.repository=youruser/flask-web
--set image.tag=v1

## Template rendering (no cluster required)

helm template webapp ./flask-web-chart


