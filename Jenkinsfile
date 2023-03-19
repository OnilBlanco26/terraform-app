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
  environment {
    DIGITAL = credentials('DIGITAL-TOKEN')
    SSHKEY = credentials('SSHKEY')
    PRIVATEKEY = credentials('PRIVATEKEY')
  }
}