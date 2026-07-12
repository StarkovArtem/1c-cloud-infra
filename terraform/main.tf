terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = ">= 0.40.0"
    }
  }
}

provider "proxmox" {
  endpoint = var.proxmox_api_url
  insecure = true # Игнорируем self-signed сертификат Proxmox
}

resource "proxmox_virtual_environment_vm" "edge_frontend" {
  name      = "edge-frontend"
  node_name = var.proxmox_node_name
  vm_id     = var.vm_id

  # Клонирование из вашего Cloud-Init шаблона
  clone {
    vm_id = var.template_vm_id
    full  = true
  }

  # Ресурсы для Edge/Frontend
  cpu {
    cores   = 2
    sockets = 1
    type    = "host"
  }

  memory {
    dedicated = 4096 # 4 GB RAM
  }

  disk {
    datastore_id = var.disk_datastore
    file_format  = "raw"
    interface    = "scsi0"
    size         = 50 # 50 GB Disk
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  
}  # Cloud-Init настройки
  initialization {
    datastore_id = var.disk_datastore
    
    ip_config {
      ipv4 {
        address = var.vm_ip_address
        gateway = var.vm_gateway
      }
    }
    
    # Настройки пользователя через параметры блока initialization
    user_account {
      keys     = [var.ssh_public_key]
      password = var.vm_password
      username = "ansible"
    }
  }