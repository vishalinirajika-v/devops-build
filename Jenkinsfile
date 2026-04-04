pipeline {
    agent any

    environment {
        DOCKER_USER = 'vishalinirajika'
        DOCKER_CREDS = credentials('dockerhub-creds')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'chmod +x build.sh deploy.sh'
                sh './build.sh ${BRANCH_NAME} ${DOCKER_USER} ${BUILD_NUMBER}'
            }
        }

        stage('Docker Login') {
            steps {
                sh 'echo $DOCKER_CREDS_PSW | docker login -u $DOCKER_CREDS_USR --password-stdin'
            }
        }

        stage('Push Image') {
            steps {
                script {
                    def image = sh(script: 'cat image_name.txt', returnStdout: true).trim()
                    def latest = sh(script: 'cat image_latest.txt', returnStdout: true).trim()
                    sh "docker push ${image}"
                    sh "docker push ${latest}"
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    def latest = sh(script: 'cat image_latest.txt', returnStdout: true).trim()
                    sh "./deploy.sh ${latest}"
                }
            }
        }
    }
}
