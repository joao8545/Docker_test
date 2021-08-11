pipeline {

    agent any

    stages {
        stage('Clean') {
            steps {
                sh 'sh clean.sh'
            }
        }
        stage('Volume') {
            steps {
                sh "docker volume create --driver local web-data"
            }
        }
        stage('Build') {
            steps {
                sh "docker build -f WebApp1.dockerfile -t webapp1 ."
                sh "docker build -f WebApp2.dockerfile -t webapp2 ."
            }
        }
        stage('Run') {
            steps {
                sh "docker run --rm -d -name web1 -u 2000:2000 --volume web-data:/logFiles webapp1"
                sh "docker run --rm -dp 5002:5002 -name web2 -u 2000:2000 --volume web-data:/logFiles webapp1"
            }
        }
        stage('Request') {
            steps {
                sh "docker exec -i web2 /bin/sh < test.sh"
            }
        }
    }
}
