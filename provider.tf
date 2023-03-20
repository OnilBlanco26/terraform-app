terraform {
  # estos son los diferentes providers
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.21.0"
    }
  }
 backend "local" {
    path = "$JENKINS_HOME/terraform/terraform.tfstate"
  }
}
variable "token" {
  type    =   string
}
variable "ssh-key" {
  type    =   string
}

module "digital" {
  source = "./digital"
  digital-token = var.token
  ssh-key = var.ssh-key
}

output "IP" {
  value = module.digital.IP
}

output "NGINX" {
  value = "http://${module.digital.IP}:8050"
}
output "postgres" {
  value = "http://${module.digital.IP}:5432"
}