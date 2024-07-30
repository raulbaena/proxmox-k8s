variable "pm_api_url" {
  description = "The URL to the Proxmox API"
}

variable "pm_user" {
  description = "Proxmox username"
}

variable "pm_password" {
  description = "Proxmox password"
}
variable "ssh_public_key" {
  description = "The SSH public key to be added to the VM"
}