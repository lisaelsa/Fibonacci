pipeline {
    agent any


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
