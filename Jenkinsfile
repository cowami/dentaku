pipeline {
    agent any

    stages {
        stage('Check Docker Installation') {
            steps {
                sh 'which docker || echo "Docker not found"'
                sh 'docker --version || echo "Docker version command failed"'
            }
        }
    }

    post {
        always {
            sh 'which docker || echo "Docker not found in post-build"'
        }
    }
}