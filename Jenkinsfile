pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my-flask-app'
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE}:${BUILD_NUMBER} ."
            }
        }

        stage('Run Tests') {
            steps {
                sh "docker run --rm ${DOCKER_IMAGE}:${BUILD_NUMBER} pytest"
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh "docker tag ${DOCKER_IMAGE}:${BUILD_NUMBER} ${DOCKERHUB_CREDENTIALS_USR}/${DOCKER_IMAGE}:${BUILD_NUMBER}"
                sh "docker push ${DOCKERHUB_CREDENTIALS_USR}/${DOCKER_IMAGE}:${BUILD_NUMBER}"
            }
        }

        stage('Deploy to Development') {
            steps {
                sh "docker stop dev-app || true"
                sh "docker rm dev-app || true"
                sh "docker run -d --name dev-app -p 5000:5000 -e FLASK_ENV=development ${DOCKERHUB_CREDENTIALS_USR}/${DOCKER_IMAGE}:${BUILD_NUMBER}"
            }
        }

        stage('Deploy to Staging') {
            steps {
                input message: 'Proceed to Staging?'
                sh "docker stop staging-app || true"
                sh "docker rm staging-app || true"
                sh "docker run -d --name staging-app -p 5001:5000 -e FLASK_ENV=staging ${DOCKERHUB_CREDENTIALS_USR}/${DOCKER_IMAGE}:${BUILD_NUMBER}"
            }
        }

        stage('Deploy to Production') {
            steps {
                input message: 'Proceed to Production?'
                sh "docker stop prod-app || true"
                sh "docker rm prod-app || true"
                sh "docker run -d --name prod-app -p 5002:5000 -e FLASK_ENV=production ${DOCKERHUB_CREDENTIALS_USR}/${DOCKER_IMAGE}:${BUILD_NUMBER}"
            }
        }
    }

    post {
        always {
            script {
                sh 'docker logout'
            }
        }
    }
}