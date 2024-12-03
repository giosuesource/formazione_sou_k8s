pipeline {
  agent {
        label 'ContainerS'
  }
   environment {
      	GIT_CREDENTIAL = 'pass_github'
   }

     stages {
        
       stage('Login and clone repo') {
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
