variable "vm_memory" {
  description = ""
  type        = number
  default     = 10240
}

variable "vm_cores" {
  description = ""
  type        = number
  default     = 1
}

variable "vm_network" {
  description = "Interface réseau de la VM"
  type        = string
  default     = "vmbr0"
}
