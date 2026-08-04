pipeline {
    agent any

    environment {
        ARM_CLIENT_ID       = credentials('azure-client-id')
        ARM_CLIENT_SECRET   = credentials('azure-client-secret')
        ARM_SUBSCRIPTION_ID = credentials('azure-subscription-id')
        ARM_TENANT_ID       = credentials('azure-tenant-id')
        ANSIBLE_HOST_KEY_CHECKING = 'False'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                dir('terraform') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('terraform') {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                dir('terraform') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage('Generate Dynamic Inventory') {
            steps {
                dir('terraform') {
                    script {
                        env.VM_IP = sh(
                            script: 'terraform output -raw public_ip',
                            returnStdout: true
                        ).trim()
                    }
                }
                writeFile file: 'ansible/inventory.ini',
                          text: "[webservers]\n${env.VM_IP} ansible_user=azureuser\n"
                sh 'cat ansible/inventory.ini'
            }
        }

        stage('Wait For SSH') {
            steps {
                sh '''
                    for i in $(seq 1 30); do
                        if nc -z -w 3 ${VM_IP} 22; then
                            echo "SSH is up"
                            exit 0
                        fi
                        echo "Waiting for SSH... attempt $i"
                        sleep 10
                    done
                    echo "SSH did not come up in time"
                    exit 1
                '''
            }
        }

        stage('Ansible Deploy') {
            steps {
                sshagent(['vm-ssh-key']) {
                    sh 'ansible-playbook -i ansible/inventory.ini ansible/install_web.yml'
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                sh 'curl -fs --retry 5 --retry-delay 5 http://${VM_IP} | grep "Deployed automatically"'
            }
        }
    }

    post {
        success {
            echo "SUCCESS! Site is live at http://${VM_IP}"
        }
        failure {
            echo "Pipeline failed. Check the stage logs above."
        }
    }
}
