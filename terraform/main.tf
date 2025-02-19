terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">=2.9.0"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.pm_api_url
  pm_user         = var.pm_user
  pm_password     = var.pm_password
  pm_tls_insecure = true
}

resource "proxmox_vm_qemu" "k8s_node" {
  count = 2
  name  = "k8s-node-${count.index + 1}"
  target_node = "pve"
  clone = "ubuntu-template"
  cores = 1
  memory = 2048
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
  disk {
    size    = "15G"
    type    = "scsi"
    storage = "local-lvm"
  }
  sshkeys = var.ssh_public_key
  os_type = "cloud-init"
  ciuser = "ubuntu"
  cipassword = "password"
}
