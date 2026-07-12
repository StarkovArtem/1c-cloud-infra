variable "proxmox_api_url" {
  description = "URL API Proxmox"
  type        = string
  default     = "https://192.168.1.10:8006/" # Замените на IP вашего Proxmox
}

variable "proxmox_node_name" {
  description = "Имя ноды Proxmox"
  type        = string
  default     = "pve" # Замените на имя вашей ноды
}

variable "vm_id" {
  description = "ID создаваемой виртуальной машины"
  type        = number
  default     = 104
}

variable "template_vm_id" {
  description = "ID шаблона (Golden Image) в Proxmox"
  type        = number
  default     = 9000 # Замените на ID вашего шаблона Ubuntu
}

variable "disk_datastore" {
  description = "Хранилище для диска ВМ"
  type        = string
  default     = "local-lvm"
}

variable "vm_ip_address" {
  description = "IP адрес ВМ в формате CIDR"
  type        = string
  default     = "192.168.1.20/24"
}

variable "vm_gateway" {
  description = "Шлюз по умолчанию"
  type        = string
  default     = "192.168.1.1"
}