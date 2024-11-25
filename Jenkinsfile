pipeline {
    agent any

    environment {
//        DOCKER_CREDENTIAL = 
        DOCKER_IMAGE_NAME = "giosuemanzo/Flask”
        DOCKER_TAG = "latest"
        DOCKER_REGISTRY = 'https://hub.docker.com/u/giosuemanzo'
    }


    stages {

 	stage('Cloning Git') {
      steps {
        git 'https://github.com/giosuesource/formazione_sou_k8s'
      }
    }

        stage('build') {
            steps {
                script {
                    docker.build (“giosuemanzo/flask”)
                }
            }
        }

        stage('push') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'giosuemanzo', variable: 'PassDocker')]) {
                        sh 'docker login -u giosuemanzo -p ${PassDocker}'
                    }

                }
            }
        }
    
}

// ultima 4
