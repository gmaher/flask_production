pipeline {

    agent any
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
                  string(credentialsId: 'cb03d560-aa5c-4b68-a538-ad77a657ef96',
                  variable: 'TOKEN')]) {

                  sh('echo token ${TOKEN}')
                  sh('echo user ${env.GIT_USER}')
                  sh('git push https://${env.GIT_USER}:${TOKEN}@github.com/gmaher/flask_production.git')

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
