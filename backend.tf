terraform {
  backend "local" {
    path = "$JENKINS_HOME/terraform/terraform.tfstate"
  }
}