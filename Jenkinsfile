pipeline {
   agent any

   environment {
        DOCKER_CREDENTIAL = 'password_docker'
        DOCKER_IMAGE = 'giosuemanzo/flask-app-example'
        //DOCKER_IMAGE_NAME = 'giosuemanzo/flask-app-example'
        DOCKER_REGISTRY = 'https://hub.docker.com/u/giosuemanzo'
	GIT_CREDENTIAL = 'pass_git'
   }

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
		          env.IMAGE_TAG = docker_tag
                }
	    }
		
        }
   

        stage('build') {
            steps {
                script {
//		    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIAL)
//                  docker.build("${DOCKER_IMAGE}:${env.IMAGE_TAG}")
		    sh "docker build -t giosuemanzo/flask-app-example:${env.IMAGE_TAG}"
                }
            }
        }

        stage('push') {
            steps {
		withCredentials([string(credentialsId: 'giosuemanzo', variable: 'password_docker')]
                script {
			sh "docker push ${DOCKER_IMAGE}:${env.IMAGE_TAG}"
                    }

                }
            }
        
   
}
