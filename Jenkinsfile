// da caricare

pipeline {
   agent any

   environment {
        DOCKER_CREDENTIAL = '81f61bb2-0ab3-425a-8af0-5fcd728d2889'
        DOCKER_IMAGE_NAME = "giosuemanzo/flask-app-example”
        DOCKER_REGISTRY = 'https://hub.docker.com/u/giosuemanzo'
    }


   stages {

 	     stage(‘Checkout’) {
          steps {
	          	checkout scm
      }
    }

//stage('Cloning Git') {
//        steps {
//          script{
//            git branch: 'main'
//            git credentialsId: 'giosuesource'
//            git url: 'https://github.com/giosuesource/formazione_sou_k8s'
//          }
//        git 'https://github.com/giosuesource/formazione_sou_k8s'
//      }


    	stage(‘Tag’) {
            steps {
                script {
                      def branch = env.BRANCH_NAME
			if (branch == ‘main’) {
				docker_tag = ‘latest’
			} else if (branch == ‘develop’) {
				docker_tag = da_finire e cambiare tutte le virgolette che sono storte
//			} else if () {
//				docker_tag = "develop-${gitCommit}"
                }
		        IMAGE_TAG = docker_tag
            }
        }



        stage('build') {
            steps {
                script {
                    docker.build (“${DOCKER_IMAGE}:${IMAGE_TAG}”)
                }
            }
        }

        stage('push') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'giosuemanzo', variable: 'PassDocker')]) {
                        sh 'docker login -u giosuemanzo -p ${PassDocker}'
			sh “docker push giosuesource/flask-app-example:${env.IMAGE_TAG}”
//			sh “docker push giosuesource/${DOCKER_IMAGE}:${env.IMAGE_TAG}”

                    }

                }
            }
        }
    }
}

