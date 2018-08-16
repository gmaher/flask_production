pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo CHECKING OUT MASTER'
                sh 'git checkout master'
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
