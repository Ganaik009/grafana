output "semmle_vm_id" {
  value = azurerm_linux_virtual_machine.semmle.id
}
output "semmle_nic_private_ip" {
  value = azurerm_network_interface.semmle_nic.private_ip_address
}