pipeline {
    agent any

    environment {
        IMAGE_NAME = "week9-cicd-app"
        IMAGE_TAG = "latest"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'python3 -m py_compile app.py'
            }
        }

        stage('Test') {
            steps {
                sh 'pytest'
            }
        }

        stage('Package') {
            steps {
                sh 'tar -czf week9-cicd-app.tar.gz app.py requirements.txt'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .'
            }
        }
    }

    post {
        success {
            echo 'CI/CD Pipeline completed successfully!'
        }

        failure {
            echo 'CI/CD Pipeline failed.'
        }
    }
}