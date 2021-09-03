output "bitdefender_vm_id" {
  value = azurerm_virtual_machine.bitdefender.id
}
output "bitdefender_nic_private_ip" {
  value = azurerm_network_interface.bitdefender_nic.private_ip_address
}