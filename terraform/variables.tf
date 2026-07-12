variable "proxmox_api_url" {
  description = "URL API Proxmox"
  type        = string
}

variable "proxmox_node_name" {
  description = "Имя ноды Proxmox"
  type        = string
}

variable "vm_id" {
  description = "ID создаваемой виртуальной машины"
  type        = number
}

variable "template_vm_id" {
  description = "ID шаблона (Golden Image) в Proxmox"
  type        = number
}

variable "disk_datastore" {
  description = "Хранилище для диска ВМ"
  type        = string
}

variable "vm_ip_address" {
  description = "IP адрес ВМ в формате CIDR"
  type        = string
}

variable "vm_gateway" {
  description = "Шлюз по умолчанию"
  type        = string
}
variable "ssh_public_key" {
  description = "Публичный SSH ключ для доступа к ВМ"
  type        = string
}

variable "vm_password" {
  description = "Пароль для пользователя ansible"
  type        = string
  sensitive   = true
}
variable "proxmox_api_token" {
  description = "API токен для Proxmox"
  type        = string
  sensitive   = true
}