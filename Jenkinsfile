pipeline {
    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        TF_PLUGIN_CACHE_DIR   = "$HOME/.terraform.d/plugin-cache"
        TF_LOG                = "DEBUG" // Enable debug logging
    }

    tools {
        terraform 'terraform-1.5'
    }

    agent any

    stages {
        stage('Checkout') {
            steps {
                dir("terraform") {
                    git "https://github.com/iam-venkateshwarlu/terraform-project.git"
                }
            }
        }

          stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }

        stage('Plan') {
            steps {
                dir('terraform') {
                    sh 'rm -rf .terraform'
                    sh 'terraform plan -out tfplan'
                }
            }
        }

        stage('Apply') {
            when {
                expression { return params.autoApprove }
            }
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }
}