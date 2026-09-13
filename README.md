# DevOps Build Project

## Live URLs
- Deployed Site: http://65.2.73.225
- Jenkins: http://65.2.73.225:8080
- Uptime Kuma: http://65.2.73.225:3001

## Docker Hub Repositories
- Dev (Public): https://hub.docker.com/r/ashok9951/dev
- Prod (Private): https://hub.docker.com/r/ashok9951/prod

## Tech Stack
- Docker & Docker Compose
- Jenkins Multibranch Pipeline (CI/CD)
- AWS EC2 (Ubuntu 22.04, t2.micro)
- Uptime Kuma (Monitoring + Down Alerts)
- GitHub Webhooks
- Bash scripting

## CI/CD Flow
1. Push to `dev` → Jenkins builds → pushes `ashok9951/dev:latest` → deploys to EC2
2. Merge to `master` → Jenkins builds → pushes `ashok9951/prod:latest`

## Screenshots
See `/screenshots` folder for Jenkins, AWS, Docker Hub, and monitoring evidence.

## Scripts
- `build.sh` — Builds the Docker image
- `deploy.sh` — Deploys the container on EC2
