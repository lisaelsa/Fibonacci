pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub_credentials') // Jenkins credentials ID for Docker Hub
        DOCKERHUB_REPO = 'lisaelsa/fibonacciapi'
    }


  stages {
    stage('Docker Build') {
            steps {
                // Execute Docker build commands here
                sh """
                docker build --no-cache -t fibonacci .              
                docker images
                """ 
                }
  }
      stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKERHUB_CREDENTIALS}") {
                        docker.image("${DOCKERHUB_REPO}:latest").push()
                    }
                }
            }
           
  }
  }
}
