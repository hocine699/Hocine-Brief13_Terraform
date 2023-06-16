pipeline {
    agent any
    stages {
        stage ('Terraform init') {
            steps {
                script {
                    sh "cd StagingEnvoronment && terraform init"
                }                
            }
        }

        stage ('Terraform Plan') {
            steps {
                script {
                    sh "cd StagingEnvoronment && terraform plan"
                }
            }
        }

        stage ('Terraform Apply') {
            steps {
                script {
                    sh "cd StagingEnvoronment && terraform apply -auto-approve"
                }    
            }
        } 
        
        stage ('reponseok') {
            steps {
                input message: 'test bon ?', ok: 'ok'
            }
        }
        
        stage ('Terraform-Init') {
            steps {
                script {
                    sh "cd ProdEnvironment && terraform init"
                }                
            }
        }
    
        stage ('Terraform-Plan') {
            steps {
                script {
                    sh "cd ProdEnvironment && terraform plan"
                }
            }
        }

        stage ('Terraform-Apply') {
            steps {
                script {
                    sh "cd ProdEnvironment && terraform apply -auto-approve"
                }    
            }
        } 
    }
}
