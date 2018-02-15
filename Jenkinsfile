pipeline {
    agent { label 'smartos' }
    environment {
        PATH = '/opt/local/java/openjdk8/bin:/opt/local/bin:/opt/local/sbin:/ec/bin:/ec/sbin:/usr/bin:/usr/sbin:/usr/ccs/bin'
    }

    stages {
        stage('Build') {
            steps {
                sh "echo Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
                sh '/usr/bin/bash buildscripts/clean.sh'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}