output "jenkins_vm_id" {
  value = azurerm_linux_virtual_machine.jenkins.id
}
output "jenkins_nic_private_ip" {
  value = azurerm_network_interface.jenkins_nic.private_ip_address
}