pipeline {
    agent any 
    stages {
        stage('Build') { 
            steps {
                sh 'python -m py_compile source/calculator_operations.py source/calculator.py' 
                stash(name: 'compiled-results', includes: 'source/*.py*') 
            }
        }
        stage('Test') {
            steps {
                sh 'py.test --junit-xml test-reports/results.xml test/test_calculator.py'
            }
            post {
                always {
                    junit 'test-reports/results.xml'
                }
            }
        }
    }
}