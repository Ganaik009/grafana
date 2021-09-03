resource "azurerm_subnet_network_security_group_association" "bh_nsg_association" {
  subnet_id                 = var.bh_subnet_id
  network_security_group_id = var.bh_nsg_id
}
resource "azurerm_subnet_network_security_group_association" "jfrog_nsg_association" {
  subnet_id                 = var.jfrog_subnet_id
  network_security_group_id = var.jfrog_nsg_id
}
resource "azurerm_subnet_network_security_group_association" "ghe_nsg_association" {
  subnet_id                 = var.ghe_subnet_id
  network_security_group_id = var.ghe_nsg_id
}
resource "azurerm_subnet_network_security_group_association" "jenkins_nsg_association" {
  subnet_id                 = var.jenkins_subnet_id
  network_security_group_id = var.jenkins_nsg_id
}
resource "azurerm_subnet_network_security_group_association" "jira_nsg_association" {
  subnet_id                 = var.jira_subnet_id
  network_security_group_id = var.jira_nsg_id
}
resource "azurerm_subnet_network_security_group_association" "platform_nsg_association" {
  subnet_id                 = var.platform_subnet_id
  network_security_group_id = var.platform_nsg_id
}
resource "azurerm_subnet_network_security_group_association" "sqlserver_nsg_association" {
  subnet_id                 = var.sqlserver_subnet_id
  network_security_group_id = var.sqlserver_nsg_id
}
resource "azurerm_subnet_network_security_group_association" "bitdefender_nsg_association" {
  subnet_id                 = var.bitdefender_subnet_id
  network_security_group_id = var.bitdefender_nsg_id
}
resource "azurerm_subnet_network_security_group_association" "sonarqube_nsg_association" {
  subnet_id                 = var.sonarqube_subnet_id
  network_security_group_id = var.sonarqube_nsg_id
}
resource "azurerm_subnet_network_security_group_association" "selenium_nsg_association" {
  subnet_id                 = var.selenium_subnet_id
  network_security_group_id = var.selenium_nsg_id
}
resource "azurerm_subnet_network_security_group_association" "ansible_nsg_association" {
  subnet_id                 = var.ansible_subnet_id
  network_security_group_id = var.ansible_nsg_id
}
resource "azurerm_subnet_network_security_group_association" "rediscache_nsg_association" {
  subnet_id                 = var.rediscache_subnet_id
  network_security_group_id = var.rediscache_nsg_id
}
resource "azurerm_subnet_network_security_group_association" "semmle_nsg_association" {
  subnet_id                 = var.semmle_subnet_id
  network_security_group_id = var.semmle_nsg_id
}