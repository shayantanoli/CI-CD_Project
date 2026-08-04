variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  default     = "devops-project-rg"
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "koreacentral"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B2ts_v2"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key" {
  description = "SSH public key for VM access"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCnTLyeJ23eaVvyaq6o0S/jlh1yKEaV4yGBAtxa1bZNpnwylLwFUui6Vn/rk47YBRPwtb/CL2n8T1BK8IMEIhFklMQlffaOMszgbmufQ24vxeExGT4VQJdttHWvej7lCbucvknl3rlyIE3qN3mNneoPKb491qNH3Ih4P51jnT5ltV86B6Gg1v1pLjHb6QliGbdBCf81gs4uNSuRchSbX0OSskEH9bAGbboE8++u/2zZbGJJ6u+p7kVXHDyDbbwjK6Mt4sqy/unKahb4FfQtYhMR2hfkstJx1Tw/j/v2HJfhlbopDUbNddE1FboHTUhtVW1Mcx4lVMmmGeRW//Svp9M7oKCt9ME8yK5IdxvVP7yJr22n+RPv373bJpKksvop4zDKfDwGpGcBxGWqYmQ9b8i2sUidXFCyVSwHQC3t90zmmKS1etEknQwmdDNlTmhb0o933obhlqKperzVkBNlt5aEHNSSnH6Sz1euUYkN8K0dh8fznMBLZJFcEADYHlpG4bQ4Tw5Z6mRrlMuCX3GLuBgrYObjRqvz4wSSriyBmnngxYVUebrQ4CRAV3dsHNfx8v7tRYYiUzydBVSV8fUq2sUcWpCSPypf8PngYl7RqTc3W4aQUcCgROtWhULSMJmr+IhE8i0F1wIIXlTFBPaUnPBHjrS4R9XPhBI64zerQJUMdw== shayan@DESKTOP-50EGOB5"
}
