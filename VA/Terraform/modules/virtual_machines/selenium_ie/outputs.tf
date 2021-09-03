output "si_vm_id" {
  value = azurerm_windows_virtual_machine.si.id
}
output "si_nic_private_ip" {
  value = azurerm_network_interface.si_nic.private_ip_address
}
