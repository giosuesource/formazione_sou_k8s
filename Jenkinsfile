pipeline {
  agent {
        label 'ContainerS'
  }
   environment {
      	GIT_CREDENTIAL = 'pass_github'
   }

     stages {
        
       stage('Clone repo') {
            steps {
	           script {
                     git branch: 'main', url: 'https://github.com/giosuesource/formazione_sou_k8s'
                   }
                 }
        }


       stage('Deploy Helm chart') {
            steps {

              export KUBECONFIG=var/jenkins_home/config.xml
              helm upgrade —install flask-app-example charts —namespace ‘formazione_sou’ —set image.tag=latest


               // sh "helm install flask-app-example --namespace=formazione_sou chart/https://github.com/giosuesource/formazione_sou_k8s" 
            }
        }




     }
}
