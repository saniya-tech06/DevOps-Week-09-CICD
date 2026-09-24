
pipeline {
    agent any

    environment {
        IMAGE_NAME = "saniya064/week9-cicd-app"
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
        sh 'pip3 install -r requirements.txt'
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
                sh '''
                    docker build \
                        -t ${IMAGE_NAME}:${BUILD_NUMBER} \
                        -t ${IMAGE_NAME}:latest .
                '''
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-credentials',
                    usernameVariable: 'DOCKER_USERNAME',
                    passwordVariable: 'DOCKER_PASSWORD'
                )]) {
                    sh '''
                        echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

                        docker push ${IMAGE_NAME}:${BUILD_NUMBER}
                        docker push ${IMAGE_NAME}:latest

                        docker logout
                    '''
                }
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    docker run --rm \
                        -v /home/adminsaniya/.kube:/root/.kube \
                        -v /home/adminsaniya/.minikube:/root/.minikube \
                        bitnami/kubectl:latest \
                        set image deployment/week9-cicd-app \
                        week9-cicd-app=${IMAGE_NAME}:${BUILD_NUMBER}
                '''
            }
        }

        stage('Verify') {
            steps {
                sh '''
                    docker run --rm \
                        -v /home/adminsaniya/.kube:/root/.kube \
                        -v /home/adminsaniya/.minikube:/root/.minikube \
                        bitnami/kubectl:latest \
                        rollout status deployment/week9-cicd-app --timeout=120s
                '''
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

