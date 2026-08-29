pipeline {
  agent any
  environment {
    DOCKER_USER = 'ashok9951'
    TAG = "${env.BUILD_NUMBER}"
  }
  stages {
    stage('Set target repo') {
      steps {
        script {
          env.REPO = (env.BRANCH_NAME == 'master') ? 'prod' : 'dev'
          env.IMAGE = "${DOCKER_USER}/${env.REPO}:${TAG}"
          echo "Branch ${env.BRANCH_NAME} -> ${env.IMAGE}"
        }
      }
    }
    stage('Build') {
      steps { sh "docker build -t ${IMAGE} -t ${DOCKER_USER}/${REPO}:latest ." }
    }
    stage('Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds',
            usernameVariable: 'U', passwordVariable: 'P')]) {
          sh '''
            echo "$P" | docker login -u "$U" --password-stdin
            docker push ${IMAGE}
            docker push ${DOCKER_USER}/${REPO}:latest
          '''
        }
      }
    }
    stage('Deploy') {
      steps { sh "./deploy.sh ${IMAGE}" }
    }
  }
  post {
    always { sh 'docker logout || true' }
  }
}
