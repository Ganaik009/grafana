output "semmle_windows_01_vm_id" {
  value = azurerm_windows_virtual_machine.semmle_windows_01.id
}
output "semmle_windows_01_nic_private_ip" {
  value = azurerm_network_interface.semmle_windows_01_nic.private_ip_address
}
