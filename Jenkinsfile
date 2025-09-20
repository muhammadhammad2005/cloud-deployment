pipeline {
    agent any
    environment {
        OPA = '/usr/local/bin/opa'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/muhammadhammad2005/cloud-deployment.git'
            }
        }
        stage('Run OPA Policy Check') {
            steps {
                script {
                    def resource = '''
                    {
                        "resource": {
                            "tags": {
                                "environment": "production",
                                "owner": "team-a"
                            }
                        }
                    }
                    '''
                    writeFile file: 'input_data.json', text: resource

                    sh """
                        ${OPA} eval --input input_data.json --data cloud_policy.rego 'data.cloud.deployments.deny'
                    """
                }
            }
        }
        stage('Deploy Cloud Resources') {
            steps {
                echo "Deploying resources..."
                // Example: sh 'terraform apply -auto-approve'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}

