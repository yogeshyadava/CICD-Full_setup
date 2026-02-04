pipeline {

    agent any

    tools {
    maven 'maven-3'
  }

    environment {
        IMAGE_NAME = "yogeshsla/javaapp"
        IMAGE_TAG  = "latest"
        CONTAINER  = "java-container"
    }

    stages {

        // 1. Clone Code
        stage('Checkout Code') {
            steps {
                git url: 'https://github.com/yogeshyadava/CICD-Full_setup.git',
                    branch: 'main'
            }
        }

        // 2. Build Java App
        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        // 3. Build Docker Image
        stage('Build Docker Image') {
            steps {
                sh '''
                  docker build -t $IMAGE_NAME:$IMAGE_TAG .
                  docker images
                '''
            }
        }

        // 4. Login to Docker Hub
        stage('Docker Login') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'docker-hub-credentials',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_PASS'
                    )
                ]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        // 5. Push Image
        stage('Push to Docker Hub') {
            steps {
                sh 'sudo docker push $IMAGE_NAME:$IMAGE_TAG'
            }
        }

        // 6. Deploy Container
        stage('Deploy Container') {
            steps {
                sh '''
                  docker rm -f $CONTAINER || true
                  docker run -d \
                  --name $CONTAINER \
                  -p 8080:8080 \
                  $IMAGE_NAME:$IMAGE_TAG
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline Completed Successfully"
        }

        failure {
            echo "❌ Pipeline Failed"
        }
    }
}
