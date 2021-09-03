output "sh_vm_id" {
  value = azurerm_windows_virtual_machine.sh.id
}
output "sh_nic_private_ip" {
  value = azurerm_network_interface.sh_nic.private_ip_address
}
