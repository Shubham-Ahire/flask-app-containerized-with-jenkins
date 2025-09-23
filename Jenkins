pipeline {
    agent { label 'worker' }
    
    stages {
        stage('Code clone') {
            steps {
                git url: "https://github.com/Shubham-Ahire/flask-dockerized-app.git", branch: "main"
            }
        }
        stage('Code build') {
            steps {
                sh 'docker compose build'
            }
        }
        stage('Push to Dockerhub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "secret", 
                    usernameVariable: "dockerHubUser", 
                    passwordVariable: "dockerHubPass")]) {
                    
                sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                sh "docker image tag flask-app-web:latest ${env.dockerHubUser}/flask-app-web:latest"
                sh "docker push ${env.dockerHubUser}/flask-app-web:latest"
                }
            }
        }
        stage('Code Deploy') {
            steps {
                sh 'docker compose up -d'
            }
        }
    }
}
