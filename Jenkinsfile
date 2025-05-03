pipeline {
    agent any

    stages {
        stage('Check Docker Version') {
            steps {
                sh 'docker --version'
            }
        }

        stage('Create and Remove Container with Volume') {
            steps {
                sh '''
                    docker volume create my_temp_volume
                    docker run --name temp_container -v my_temp_volume:/data alpine echo "hello"
                    docker rm temp_container
                '''
            }
        }

        stage('List Volumes') {
            steps {
                sh 'docker volume ls'
            }
        }

        stage('Try Manual Volume Removal') {
            steps {
                sh 'docker volume rm my_temp_volume || echo "Volume might be in use or deleted"'
            }
        }

        stage('Prune Unused Volumes') {
            steps {
                sh 'docker volume prune -f'
            }
        }
    }
}
