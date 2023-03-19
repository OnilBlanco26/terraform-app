pipeline {
  agent any
  stages {
    stage('terraform init') {
      agent any
      steps {
        sh 'terraform init'
        sh 'terraform destroy -var="token=$DIGITAL" -var="ssh-key=$SSHKEY" -var="priv-key=$PRIVATEKEY" --auto-approve'
      }
    }
    stage('terraform destroy') {
      agent any
      steps {
        sh 'terraform destroy -var="token=$DIGITAL" -var="ssh-key=$SSHKEY" -var="priv-key=$PRIVATEKEY" --auto-approve'
      }
    }

    stage('terraform build') {
      agent any
      steps {
        sh 'terraform apply -var="token=$DIGITAL" -var="ssh-key=$SSHKEY" -var="priv-key=$PRIVATEKEY" --auto-approve'
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