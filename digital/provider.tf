terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.21.0"
    }
  }
}

variable "digital-token" {
  type    =   string
}

variable "ssh-key" {
  type    =   string
}

provider "digitalocean" {
  token = "${var.digital-token}"
}


# # Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "web" {
  image    = "ubuntu-22-04-x64"
  name     = "Onil-droplet"
  region   = "nyc3"
  size     = "s-2vcpu-2gb"
  ssh_keys = ["${var.ssh-key}"]
  #  provisioner "local-exec" {
  # command = "${file("./terraform-docker/main.sh")}"
  # }
  connection {
    type        = "ssh"
    port        = 22
    user        = "root"
    host        = digitalocean_droplet.web.ipv4_address
    private_key = file("C:/Users/Onil/.ssh/id_rsa")
  }

  provisioner "file" {
    source      = "digital/main.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh",
    ]
  }
}

output "IP" {
  value = digitalocean_droplet.web.ipv4_address
}
  

  