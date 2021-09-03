output "sqlserver_vm_id" {
  value = azurerm_windows_virtual_machine.sqlserver.id
}
output "sqlserver_nic_private_ip" {
  value = azurerm_network_interface.sqlserver_nic.private_ip_address
}
