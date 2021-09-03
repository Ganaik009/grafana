output "sonarqube_vm_id" {
  value = azurerm_windows_virtual_machine.sonarqube.id
}
output "sonarqube_nic_private_ip" {
  value = azurerm_network_interface.sonarqube_nic.private_ip_address
}
