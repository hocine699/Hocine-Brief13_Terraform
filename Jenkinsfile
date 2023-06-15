pipeline {
    agent any
  
    parameters
    {
        booleanParam(defaultValue: true, description: '', name: 'Deploy')
        choice(choices: ['apply', 'destroy'], name: 'Action')
    }
    
    stages {
        
        stage ('Terraform Init') {
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
                    sh "cd StagingEnvoronment && terraform ${params.Action} -auto-approve && terraform -output -raw"
                    sh "StagingPublicIP=${terraform output -raw The_webserver_Public_ip}"
                }    
            }
        } 
}
}
