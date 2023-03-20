pipeline {
  agent {
    label 'terraform'
  }
  stages {
    stage('terraform init') {
      steps {
        sh 'terraform init'
      }
    }
    stage('terraform destroy') {
      steps {
        sh 'terraform destroy -var="token=$DIGITAL" -var="ssh-key=$SSHKEY" --auto-approve'
      }
    }
    stage('terraform apply') {
      steps {
        input message: '¿Estás seguro que quieres aplicar los cambios?', ok: 'Sí'
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
 