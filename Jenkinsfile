pipeline {
  agent {
        label 'ContainerS'
  }	    
   environment {
        DOCKER_CREDENTIAL = 'password_docker'
        DOCKER_IMAGE = '/flask-app-example'
        DOCKER_REGISTRY = 'https://index.docker.io/v1/'	   
	GIT_CREDENTIAL = 'pass_github'
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
//		    docker.image('docker:latest').inside('-v /var/run/docker.sock:/var/run/docker.sock'){
		    sh "docker build -t giosuemanzo/flask-app-example:${env.IMAGE_TAG} ."
		    } 
                
            }
        }

 	stage('Push') {
            steps {
                    script {
			docker.withRegistry('https://index.docker.io/v1/', 'password_docker'){
                        sh "docker push giosuemanzo/flask-app-example:${env.IMAGE_TAG}"
			}
                    }
                }
            }
        
    }
}
