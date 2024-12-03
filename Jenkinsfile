pipeline {
    agent {
        label 'ContainerS'
    }

    environment {
        GIT_CREDENTIAL = 'pass_github'
        KUBECONFIG = '/var/jenkins_home/.kube/config' 
    }

    stages {

        stage('Clone repo') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/giosuesource/formazione_sou_k8s', credentialsId: GIT_CREDENTIAL
                }
            }
        }

        stage('Deploy Helm chart') {
            steps {
                script {
                    sh 'export KUBECONFIG=$KUBECONFIG'

                    sh '''
                        helm upgrade --install flask-app-example charts --namespace formazione_sou --set image.tag=latest
                    '''
                }
            }
        }

    }
}
