output "jfrog_vm_id" {
  value = azurerm_windows_virtual_machine.jfrog.id
}
output "jfrog_nic_private_ip" {
  value = azurerm_network_interface.jfrog_nic.private_ip_address
}
