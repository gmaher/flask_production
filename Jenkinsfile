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

                git(
                  url: 'https://github.com/gmaher/flask_production.git',
                  credentialsId: 'cb03d560-aa5c-4b68-a538-ad77a657ef96',
                  branch: 'master'
                  )

                sh 'echo PUSHING TO GITHUB...'
                sh 'git push origin master'
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
