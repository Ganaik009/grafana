#AzureFirewallSubnet
output "azurefirewallsubnet_id" {
  value = azurerm_subnet.azurefirewallsubnet.id
}

#GatewaySubnet
output "gatewaysubnet_id" {
  value = azurerm_subnet.gatewaysubnet.id
}

#Bastion Host Subnet
output "bh_subnet_id" {
  value = azurerm_subnet.bh_subnet.id
}

#Bitdefender Subnet
output "bitdefender_subnet_id" {
  value = azurerm_subnet.bitdefender_subnet.id
}

#jFrog Subnet
output "jfrog_subnet_id" {
  value = azurerm_subnet.jfrog_subnet.id
}

#Github Enterprise Subnet
output "ghe_subnet_id" {
  value = azurerm_subnet.ghe_subnet.id
}

#Jira Subnet
output "jira_subnet_id" {
  value = azurerm_subnet.jira_subnet.id
}

#Jenkins Subnet
output "jenkins_subnet_id" {
  value = azurerm_subnet.jenkins_subnet.id
}

#Sonarqube Subnet
output "sonarqube_subnet_id" {
  value = azurerm_subnet.sonarqube_subnet.id
}

#Selenium Subnet
output "selenium_subnet_id" {
  value = azurerm_subnet.selenium_subnet.id
}

#Ansible Subnet
output "ansible_subnet_id" {
  value = azurerm_subnet.ansible_subnet.id
}

#SQL Server Subnet
output "sqlserver_subnet_id" {
  value = azurerm_subnet.sqlserver_subnet.id
}

#platform Subnet
output "platform_subnet_id" {
  value = azurerm_subnet.platform_subnet.id
}

#Redis Cache Subnet
output "rediscache_subnet_id" {
  value = azurerm_subnet.rediscache_subnet.id
}

#Semmle Subnet
output "semmle_subnet_id" {
  value = azurerm_subnet.semmle_subnet.id
}
