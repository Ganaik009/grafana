output "jenkins_linux_01_vm_id" {
  value = azurerm_linux_virtual_machine.jenkins_linux_01.id
}
output "jenkins_linux_01_nic_private_ip" {
  value = azurerm_network_interface.jenkins_linux_01_nic.private_ip_address
}