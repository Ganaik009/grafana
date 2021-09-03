output "ghe_vm_id" {
  value = azurerm_linux_virtual_machine.ghe.id
}
output "ghe_nic_private_ip" {
  value = azurerm_network_interface.ghe_nic.private_ip_address
}