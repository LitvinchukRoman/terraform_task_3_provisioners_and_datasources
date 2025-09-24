
# Ім’я префікса для всіх ресурсів
variable "prefix" {
  type        = string
  description = "Common prefix for all resources"
  default     = "tfvmex"
}

data "azurerm_public_ip" "main" {
  name                = "MyPublicIP"          
  resource_group_name = var.resource_group_name
}

# Ім’я існуючої Resource Group
variable "resource_group_name" {
  type        = string
  description = "Name of the existing Resource Group"
}

# Ім’я існуючої Virtual Machine
variable "vm_name" {
  type        = string
  description = "Name of the existing Linux VM"
}

# SSH користувач для підключення до VM
variable "ssh_user" {
  type        = string
  description = "SSH username for the VM"
  default     = "testadmin"
}

# Шлях до приватного ключа для SSH
variable "ssh_private_key_path" {
  type        = string
  description = "Path to SSH private key for connecting to the VM"
  default     = "~/.ssh/id_rsa"
}

# Пароль (якщо використовуєш password замість ключа)
variable "ssh_password" {
  type        = string
  description = "SSH password for the VM (if not using private key)"
  default     = "Password1234!"
}

# Ім’я існуючої мережі
variable "vnet_name" {
  type        = string
  description = "Name of the existing Virtual Network"
}

# Ім’я підмережі
variable "subnet_name" {
  type        = string
  description = "Name of the existing Subnet"
}

# Ім’я мережевого інтерфейсу
variable "nic_name" {
  type        = string
  description = "Name of the existing Network Interface"
}