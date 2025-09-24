resource "null_resource" "provision_vm" {
  triggers = {
    vm_public_ip = data.azurerm_public_ip.main.ip_address
  }

  provisioner "file" {
    source      = "./page.html"
    destination = "/home/${var.ssh_user}/page.html"

    connection {
      type        = "ssh"
      host        = self.triggers.vm_public_ip
      user        = var.ssh_user
      private_key = file(var.ssh_private_key_path) # або password, якщо використовуєш пароль
    }
  }

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      host        = self.triggers.vm_public_ip
      user        = var.ssh_user
      private_key = file(var.ssh_private_key_path)
    }

    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y nginx",
      "sudo mv /home/${var.ssh_user}/page.html /var/www/html/index.html",
    ]
  }
}