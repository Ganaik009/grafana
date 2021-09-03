output "sf_vm_id" {
  value = azurerm_windows_virtual_machine.sf.id
}
output "sf_nic_private_ip" {
  value = azurerm_network_interface.sf_nic.private_ip_address
}
