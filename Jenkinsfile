pipeline {
  agent {
        label 'ContainerS'
  }
   environment {
      	GIT_CREDENTIAL = 'pass_github'
   }

     stages {
//
//	stage('Checkout') {
//            steps {
//	          	checkout scm
//	    }
//        }

	stage('install Helm and K8s') {
            steps {
                script {
		    sh "apt-get update && apt-get install helm"
//		    sh "apt-get update && apt-get install -y kubectl"
		} 

	    } 
        }

        stage('Login and clone Helm') {
            steps {
	        script {
                     git branch: 'main', credentialsId: 'pass_github', url: 'https://github.com/giosuesource/formazione_sou_k8s'
                     git url: 'https://github.com/giosuesource/formazione_sou_k8s', branch: 'main'   
	             sh "git pull chart main"
                }
            }
        }
     }
}
