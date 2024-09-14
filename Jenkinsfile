pipeline {
    agent any 
    stages {
        stage('Build') { 
            steps {
                sh 'python -m py_compile source/calculator.py' 
                stash(name: 'compiled-results', includes: 'source/*.py*') 
            }
        }
    }
}