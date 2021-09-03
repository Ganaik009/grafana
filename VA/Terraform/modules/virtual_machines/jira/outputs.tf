output "jira_vm_id" {
  value = azurerm_linux_virtual_machine.jira.id
}
output "jira_nic_private_ip" {
  value = azurerm_network_interface.jira_nic.private_ip_address
}