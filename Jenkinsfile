pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub_credentials') // Jenkins credentials ID for Docker Hub
        DOCKERHUB_REPO = 'lisaelsa/fibonacciapi'
        CONTAINER_NAME= 'fibonacci_container'
    }
    stages {
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKERHUB_REPO}:latest")
                }
            }
        }
        stage('Login to Docker Hub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.image("${DOCKERHUB_REPO}:latest").push()
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Remove any existing container with the same name
                    sh 'docker rm -f fibonacci_container || true'

                    // Run the Docker container
                    sh '''
                    docker run -d --name fibonacci_container -p 5000:5000 ${DOCKERHUB_REPO}:latest
                    exit 0;
                    '''    
                }
            }
        }     
    }
    

    post {
        always {
            script {
                // Show logs from the container for debugging
                sh 'docker logs ${CONTAINER_NAME}'
            }
        }
        success {
            echo 'Docker image has been successfully pushed to Docker Hub'
        }
        failure {
            echo 'Failed to push Docker image to Docker Hub'
        }
    }
}

