pipeline {
    agent any
    
    environment {
        ARM_SUBSCRIPTION_ID = "c4774376-bc4c-48e6-93eb-c0ac26c6345d" 
        ARM_TENANT_ID = "c8cd0425-e7b7-4f3d-9215-7e5fa3f439e8"
        ARM_CLIENT_ID = "22369c68-5079-42bd-9315-f0f0291ac0a6"
        ARM_CLIENT_SECRET = credentials('az_secret') // UPDATED 
    }

    stages {
        stage ('init') {
	        steps {  
	            sh '''
                terraform init
                '''      
	        }
	    }
        stage ('plan') {
            steps {
                sh '''
                terraform plan -no-color
                '''
            }
        }
        stage ('apply') {
            steps {
                sh '''
                terraform apply -auto-approve -no-color
                '''
            }
        }
    }
}