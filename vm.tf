resource "proxmox_vm_qemu" "vm" {
  name = "alpine-vm"
  target_node = "pev1"  # Remplacez par le nom de votre nœud Proxmox si différent
  
  # Utilisation de l'ISO Alpine
  iso = "local:iso/alpine.iso"  # ISO dans le datastore local
  
  # Configuration matérielle
  cores = 2
  sockets = 1
  memory = 2048
  
  # Configuration du contrôleur SCSI en virtio-scsi-single
  scsihw = "virtio-scsi-single"
  
  # Configuration disque
  disk {
    size = "20G"
    type = "scsi"
    storage = "local"  # Utilisation du datastore local
  }
  
  # Configuration réseau
  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  
  # Configuration d'amorçage
  boot = "order=scsi0;ide2"
  
  # Paramètres additionnels
  agent = 1
  onboot = true
  
  # Paramètres optionnels
  # desc = "VM créée avec Terraform"
  # cpu = "host"
}

output "vm_id" {
  value = proxmox_vm_qemu.vm.id
}

output "vm_name" {
  value = proxmox_vm_qemu.vm.name
}
