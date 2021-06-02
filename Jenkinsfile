// declarative
properties([pipelineTriggers([githubPush()])])
pipeline {
    agent any 
    parameters {
        choice (name: 'ACTION',
                choices: [ 'apply', 'destroy'],
                description: 'Run terraform  apply / destroy')  
    }
    
    stages {
        stage ('Authenticate AWS') {
            steps {
                echo 'Authenticating using AWS credentials...'
                withAWS (credentials: 'cyrille-aws-cred', region: 'us-east-1') {
                    sh 'aws iam get-user'
                }
            }
        }
        stage ('terraform init') {
            steps {
                echo 'Initializing Terraform...'
                sh 'terraform init'
                sh 'terraform plan'
            }
        }
        stage ('Approval') {
            steps {
                script {
                    def userInput = input id: 'Confirm', message: 'Do  you approve this plan?', parameters: [booleanParam(defaultValue: false, description: '', name: 'Apply terraform?')]
                }
            }
        }
        stage ('Terraform apply') {
            when { 
                anyOf {
                    expression { params.ACTION == 'apply'}
                }
            }
            steps {
                echo 'Terraform Apply...'
                 sh 'terraform apply -auto-approve'
            }
        }
        stage ('Terraform Destroy') {
            when {
                anyOf {
                    expression { params.ACTION == 'destroy'}
                }
            }
            steps {
                echo 'Terraform Destroy...'
                 sh 'terraform destroy --force'
            }
        }
    }
}