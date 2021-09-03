output "ansible_vm_id" {
  value = azurerm_linux_virtual_machine.ansible.id
}
output "ansible_nic_private_ip" {
  value = azurerm_network_interface.ansible_nic.private_ip_address
}