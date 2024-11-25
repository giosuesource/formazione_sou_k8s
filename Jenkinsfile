pipeline {
   agent any

   environment {
  //        DOCKER_CREDENTIAL = 
        DOCKER_IMAGE_NAME = "giosuemanzo/Flask"
        DOCKER_TAG = "latest"
        DOCKER_REGISTRY = 'https://hub.docker.com/u/giosuemanzo'
    }


   stages {

 	    stage('Cloning Git') {
        steps {
          script{
            git credentialsId: '325732c7-0c17-457e-bb8a-619b201d9a63', url: 'https://github.com/giosuesource/formazione_sou_k8s', branch: 'main'
          }
//        git 'https://github.com/giosuesource/formazione_sou_k8s'
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
}

// ultima 4

