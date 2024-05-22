pipeline {
    agent any
    environment {
        dockerImage = 'seatunnel'
        dockerTag = sh(script: 'date "+%Y%m%d%H%M%S"', returnStdout: true).trim()
        dockerHubRegistry   = 'docker.io/patiala'
        ARTIFACTORY_ACCESS_TOKEN = credentials('ARTIFACTORY_ACCESS_TOKEN')
        DOCKERHUB_USERNAME = credentials('docker_patiala_cred')
        DOCKERHUB_PASSWORD = credentials('docker_patiala_cred')
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
  }
}
