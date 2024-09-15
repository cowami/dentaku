pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }

    stages {
        stage('Debug') {
            steps {
                sh 'echo "Hello, Jenkins!"'
                sh 'echo $DOCKERHUB_CREDENTIALS_USR'
                sh 'echo $DOCKERHUB_CREDENTIALS exists'
                sh 'whoami'
                sh 'pwd'
            }
        }
    }
}