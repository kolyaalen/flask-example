pipeline {
    agent any
    stages {
        stage('Build Docker Image') {
            steps {
                echo "Build Docker Image step"
                script {
                    app = docker.build("kolyaalen/python")
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    echo "Push Docker Image step"
                    docker.withRegistry('https://registry.hub.docker.com', 'docker_hub') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                        echo "${env.BUILD_NUMBER}"
                    }
                }
            }
        }
        stage('DeployToProduction') {
            steps {
                input 'Deploy to Production?'
                milestone(1)
                withCredentials([usernamePassword(credentialsId: 'webserver', usernameVariable: 'USERNAME', passwordVariable: 'USERPASS')]) {
                    script {
                        sh "sshpass -p '$USERPASS' -v ssh -o StrictHostKeyChecking=no $USERNAME@$prod \"docker pull kolyaalen/python:${env.BUILD_NUMBER}\""
                        try {
                            sh "sshpass -p '$USERPASS' -v ssh -o StrictHostKeyChecking=no $USERNAME@$prod \"docker stop kolyaalen_python\""
                            sh "sshpass -p '$USERPASS' -v ssh -o StrictHostKeyChecking=no $USERNAME@$prod \"docker rm kolyaalen_python\""
                        } catch (err) {
                            echo: 'caught error: $err'
                        }
                        sh "sshpass -p '$USERPASS' -v ssh -o StrictHostKeyChecking=no $USERNAME@$prod \"docker run --restart always --name kolyaalen_python -p 8080:8080 -d kolyaalen/python:${env.BUILD_NUMBER}\""
                    }
                }
            }
        }
    }
}
