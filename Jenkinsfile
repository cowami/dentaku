pipeline {
    agent any

    environment {
        DUMMY_VARIABLE = 'test'
    }

    stages {
        stage('Debug') {
            steps {
                sh 'echo "Hello, Jenkins!"'
                sh 'echo $DUMMY_VARIABLE'
                sh 'whoami'
                sh 'pwd'
            }
        }
    }
}