# Hocine-Brief14

Déploiement d'une infrastructure avec Terraform, construction d'un conteneur Docker, envoi de
l'image sur Docker Hub et orchestration du déploiement sur deux machines virtuelles via de
Jenkin.

Pour la récupération des données pour les credentials Azure : 
- $sp = New-AzADServiceprincipal -displayName srvAzTerraform -role "Contributor"
- Get-AzSubscription
- $sp.appId
- $sp.PasswordCredentials.SecretText

  - Après l'intallation de docker, il est imortant de d'executer ces commandes afin de donner des autorisations pour l'utilisation du sudo :
  - sudo usermod -aG docker $USER
  - sudo chown $USER:docker /var/run/docker.sock
  - bsudo chmod 666 /var/run/docker.sock

1- Dans Jenkins, créer un nouveau projet pipeline, et renseigner les champs GitHub
Project dans Général, GitHub hook trigger dans Build Triggers, et dans le champs
“Pipeline, choisir “Pipeline script from SCM”.
2- Pour que cela marche, il faut donner les autorisations à Jenkins d'exécuter les tâches sur Azure, pour cela, il faut se rendre dans “Credentials” depuis la plateforme Jenkins, cliquer sur “Administrer Jenkins”, puis
“Credentials”. Rentrer dans les “Credentials” puis les “Identifiants globaux”, et cliquer sur
“Add Credentials”. ainsi que les infos demandées.
3- Remplir le Jenkinsfile en faisant appel au “Crédential” créé avec cette ligne : MY_CRED = credentials ('azureconnexion') ...Dans le Jenkinsfile, nous aurons toutes les commandes et les étapes que Jenkins executera 
: pipeline {
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

 5 - Concernant la surveillance, j'utilise Insight, depuis le portail Azure et sélectionner la VM de notre choix et puis à gauche, supervision, , performances et on choisi ce dont nous avons besoin (alertes...)


