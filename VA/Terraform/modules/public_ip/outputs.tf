#AzureFirewallpublic_ip
output "firewall_public_ip_id" {
  value = azurerm_public_ip.firewall_public_ip.id
}
output "firewall_public_ip_address" {
  value = azurerm_public_ip.firewall_public_ip.ip_address
}

#jFrog public_ip
output "jfrog_public_ip_id" {
  value = azurerm_public_ip.jfrog_public_ip.id
}
output "jfrog_public_ip_address" {
  value = azurerm_public_ip.jfrog_public_ip.ip_address
}

#Github Enterprise public_ip
output "ghe_public_ip_id" {
  value = azurerm_public_ip.ghe_public_ip.id
}
output "ghe_public_ip_address" {
  value = azurerm_public_ip.ghe_public_ip.ip_address
}

#Jira public_ip
output "jira_public_ip_id" {
  value = azurerm_public_ip.jira_public_ip.id
}
output "jira_public_ip_address" {
  value = azurerm_public_ip.jira_public_ip.ip_address
}
#Jenkins public_ip
output "jenkins_public_ip_id" {
  value = azurerm_public_ip.jenkins_public_ip.id
}
output "jenkins_public_ip_address" {
  value = azurerm_public_ip.jenkins_public_ip.ip_address
}

#Sonarqube public_ip
output "sonarqube_public_ip_id" {
  value = azurerm_public_ip.sonarqube_public_ip.id
}
output "sonarqube_public_ip_address" {
  value = azurerm_public_ip.sonarqube_public_ip.ip_address
}

#platform public_ip
output "platform_public_ip_id" {
  value = azurerm_public_ip.platform_public_ip.id
}
output "platform_public_ip_address" {
  value = azurerm_public_ip.platform_public_ip.ip_address
}

