pipeline {
  agent any
  stages {
    stage('terraform init') {
      agent any
      steps {
        sh 'terraform init'
      }
    }

  }
  tools {
    terraform 'Terraform'
  }
}