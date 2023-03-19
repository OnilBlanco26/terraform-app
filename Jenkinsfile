pipeline {
  agent any
  tools {
    terraform 'Terraform'
  }
  environment{
    DIGITAL = credentials('DIGITAL-TOKEN')
    SSHKEY = credentials('SSHKEY-TOKEN')
    PRIVATEKEY = credentials('PRIVATE-TOKEN')
  }
  stages {
    stage('terraform init') {
      agent any
      steps {
        sh 'terraform init'
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
}