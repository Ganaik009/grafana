output "bh_vm_id" {
  value = azurerm_windows_virtual_machine.bastionhost.id
}
output "bh_nic_private_ip" {
  value = azurerm_network_interface.bh_nic.private_ip_address
}
