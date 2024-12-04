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
                    git branch: 'main', url: 'https://github.com/giosuesource/formazione_sou_k8s', credentialsId: GIT_CREDENTIAL
                }
            }
        }

        stage('Deploy Helm chart') {
            steps {
                script {
          //          sh 'export KUBECONFIG=/.kube/config'
                    sh 'export KUBECONFIG=/home/jenkins/.kube/config'
                    sh '''
                        helm upgrade --install 'custom' ./chart/custom  --namespace formazione-sou --set image.tag=latest
                    '''
                }
            }
        }

    }
}
