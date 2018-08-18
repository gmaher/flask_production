def GIT_USER     = 'gmaher'
def GIT_URL      = 'github.com/gmaher/flask_production.git'
def CRED_ID      = 'cb03d560-aa5c-4b68-a538-ad77a657ef96'
def DOCKER_IMAGE = "${env.DOCKER_IMAGE}"
def DOCKER_PORT  = "${env.DOCKER_PORT}"
def HOST_PORT    = "${env.HOST_PORT}"

pipeline {

    agent any

    stages {
        stage('Build') {
            steps {
                sh "echo ${DOCKER_IMAGE} ${DOCKER_PORT} ${HOST_PORT}"
                sh 'echo CHECKING OUT MASTER'
                sh 'git checkout master'
                sh 'git merge -m "jenkins" origin/dev'
            }
        }

        stage('Test') {
            steps {
                sh 'echo "test"'
            }
        }

        stage('Deploy') {
            steps {

                sh 'echo PUSHING TO GITHUB...'

                withCredentials([
                  string(credentialsId: "${CRED_ID}",
                  variable: 'TOKEN')]) {

                  sh('echo token ${TOKEN}')
                  sh("git push https://${GIT_USER}:${TOKEN}@${GIT_URL}")

              }

              sh("docker rm \$(docker stop \$(docker ps -a -q --filter ancestor=${DOCKER_IMAGE} --format='{{.ID}}'))")
              sh("docker build -t ${DOCKER_IMAGE} .")
              sh("docker run -dp ${HOST_PORT}:${DOCKER_PORT} ${DOCKER_IMAGE}")
            }
        }
    }

    post {
      always {
          echo 'running pipeline'
      }
      success {
          echo 'all steps were successful'
      }
      failure {
          echo 'pipline failed'
      }
      unstable {
          echo 'pipeline unstable'
      }
      changed {
          echo 'This will run only if the state of the Pipeline has changed'
          echo 'For example, if the Pipeline was previously failing but is now successful'
      }
    }
}
