resource "proxmox_vm_qemu" "vm_template" {
  name        = "ubuntu-vm"
  target_node = "pev1"  # Remplacez par le nom de votre nœud Proxmox si différent

  # Utilisation du template ID 9000
  clone = "ubuntu-24-cloudinit"  # Clonage depuis le template existant

  # Configuration matérielle
  cores   = 2
  sockets = 1
  memory  = 2048

  # Configuration du contrôleur SCSI en virtio-scsi-single
  scsihw = "virtio-scsi-single"

  # Configuration disque
  disk {
    size    = "20G"
    type    = "scsi"
    storage = "local"  # Utilisation du stockage local-lvm
  }

  # Configuration réseau
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  # Activation de Cloud-Init
  ipconfig0 = "dhcp"

  # Configuration d'amorçage
  boot = "order=scsi0;ide2"

  # Paramètres additionnels
  agent  = 1
  onboot = true
}

output "vm_id_clone" {
  value = proxmox_vm_qemu.vm.id
}

output "vm_name_clone" {
  value = proxmox_vm_qemu.vm.name_from_template
}
