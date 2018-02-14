node {
    checkout scm
    agent { label 'smartos' }

    stage('Build') {
        echo 'Building....'
        echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
        sh 'buildscripts/clean.sh'
    }
    stage('Test') {
        echo 'Building....'
    }
    stage('Deploy') {
        echo 'Deploying....'
    }
}
