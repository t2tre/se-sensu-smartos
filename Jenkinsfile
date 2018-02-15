pipeline {
    agent { label 'smartos' }
    environment {
        PATH = '/opt/local/java/openjdk8/bin:/opt/local/bin:/opt/local/sbin:/ec/bin:/ec/sbin:/usr/bin:/usr/sbin:/usr/ccs/bin'
    }

    stages {
        stage('Build') {
            steps {
                sh "echo Starting build ${env.BUILD_ID}"
                sh '/usr/bin/bash buildscripts/show_vars.sh'
                sh '/usr/bin/bash buildscripts/clean.sh'
                sh '/usr/bin/bash buildscripts/build_sensu.sh'
                sh '/usr/bin/bash buildscripts/build_prometheus_exporters.sh'
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