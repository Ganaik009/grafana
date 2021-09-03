output "platform_vm_id" {
  value = azurerm_linux_virtual_machine.platform.id
}
output "platform_nic_private_ip" {
  value = azurerm_network_interface.platform_nic.private_ip_address
}