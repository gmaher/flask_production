pipeline {

    agent any

    environment {
      GIT_USER = 'gmaher'
      GIT_URL  = 'github.com/gmaher/flask_production.git'
      CRED_ID  = 'cb03d560-aa5c-4b68-a538-ad77a657ef96'
    }

    stages {
        stage('Build') {
            steps {
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
                  string(credentialsId: '${env.CRED_ID}',
                  variable: 'TOKEN')]) {

                  sh('echo token ${TOKEN}')
                  sh('git push https://${env.GIT_USER}:${TOKEN}@${env.GIT_URL}')

              }
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
