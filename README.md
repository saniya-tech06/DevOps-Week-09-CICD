# Week 9 – Advanced CI/CD & Deployment Strategies

This project demonstrates a basic CI/CD pipeline using **Jenkins, GitHub, Docker, Docker Hub, Python, and Pytest**.

## Project Overview

The pipeline automatically performs the following steps:

**GitHub → Jenkins → Build → Test → Package → Docker Build → Docker Push**

## Technologies Used

* Python
* Pytest
* Git & GitHub
* Jenkins
* Docker
* Docker Hub
* Jenkinsfile

## Project Files

```text
DevOps-Week-09-CICD/
├── app.py
├── test_app.py
├── requirements.txt
├── Dockerfile
└── Jenkinsfile
```

## Application

The application contains a simple Python `add()` function.

Example:

```text
2 + 3 = 5
```

## Automated Testing

Pytest is used to test the application.

The Jenkins pipeline runs the automated test during the **Test** stage.

```text
1 test passed
```

## Jenkins Pipeline Stages

### 1. Checkout

Retrieves the latest source code from GitHub.

### 2. Build

Checks and compiles the Python application.

### 3. Test

Runs automated tests using Pytest.

### 4. Package

Creates a compressed package of the application files.

### 5. Docker Build

Builds the Docker image using the Dockerfile.

### 6. Docker Push

Pushes the Docker image to Docker Hub.

## Docker Image

Docker Hub repository:

https://hub.docker.com/r/saniya064/week9-cicd-app

Image:

```text
saniya064/week9-cicd-app:latest
```

## Environment Variables

The Jenkinsfile uses environment variables for the Docker image configuration:

```text
IMAGE_NAME
IMAGE_TAG
```

Docker Hub credentials are stored securely in Jenkins credentials and are not included directly in the Jenkinsfile.

## Deployment Strategies Studied

### Blue-Green Deployment

Blue-Green Deployment uses two environments. The current version runs in the Blue environment while the new version is deployed and tested in the Green environment. Traffic can then be switched to the new version.

### Rolling Deployment

Rolling Deployment gradually replaces the old application version with the new version in small groups while keeping the application available.

## Result

The Jenkins CI/CD pipeline was successfully executed, including:

* GitHub Checkout
* Build
* Automated Testing
* Package
* Docker Image Build
* Docker Image Push

The Docker image was successfully pushed to Docker Hub.

## Repository

GitHub Repository:

https://github.com/saniya-tech06/DevOps-Week-09-CICD
