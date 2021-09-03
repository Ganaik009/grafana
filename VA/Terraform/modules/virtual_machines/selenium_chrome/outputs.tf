output "sc_vm_id" {
  value = azurerm_windows_virtual_machine.sc.id
}
output "sc_nic_private_ip" {
  value = azurerm_network_interface.sc_nic.private_ip_address
}
