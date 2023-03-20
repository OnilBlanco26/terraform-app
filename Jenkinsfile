pipeline {
  agent any
  stages {
    stage('terraform init') {
      agent any
      steps {
        sh 'terraform init'
        sh 'terraform destroy -var="token=$DIGITAL" -var="ssh-key=$SSHKEY" --auto-approve'
        sh 'terraform apply -var="token=$DIGITAL" -var="ssh-key=$SSHKEY" --auto-approve'
      }
    }
  }
 
 
   
  tools {
    terraform 'Terraform'
  }
  environment {
    DIGITAL = credentials('DIGITAL-TOKEN')
    SSHKEY = credentials('SSHKEY')
  }
}
