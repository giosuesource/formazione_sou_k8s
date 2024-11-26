pipeline {
   agent any

   environment {
        DOCKER_CREDENTIAL = 'password_docker'
        DOCKER_IMAGE_NAME = 'giosuemanzo/flask-app-example'
        DOCKER_REGISTRY = 'https://hub.docker.com/u/giosuemanzo'
    }

//
   stages {

 	stage('Checkout') {
            steps {
	          	checkout scm
	    }
        }

    	stage('Tag') {
            steps {
                script {
                   def branch = env.BRANCH_NAME
		   def docker_tag = 'latest'
			 if (branch == 'main') {
		            docker_tag = 'latest'
		         } else if (branch == 'develop') {
			    docker_tag = 'develop-${sha}'
			 } else { 
				docker_tag = 'develop-${gitCommit}'
                   }
		          IMAGE_TAG = docker_tag
                }
	   }
		
       }
   



        stage('build') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${IMAGE_TAG}")
                }
            }
        }

        stage('push') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'giosuemanzo', variable: 'password_docker')]) {
                        sh 'docker login -u giosuemanzo -p ${password_docker}'
			sh "docker push giosuemanzo/flask-app-example:${env.IMAGE_TAG}"
			sh "docker push giosuemanzo/${DOCKER_IMAGE}:${env.IMAGE_TAG}"

                    }

                }
            }
        }
    }
}

