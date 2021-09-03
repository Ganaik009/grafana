variable "network_rg_name" {
  type        = string
  description = "The name of the Network resource group"
}
variable "location" {
  type        = string
  description = "The name of the Network resource group"
}
variable "firewall_name" {
  type        = string
  description = "The name of the Network resource group"
}
variable "azurefirewallsubnet_id" {}
variable "firewall_public_ip_id" {}

variable "jfrog_public_ip_id" {}
variable "jfrog_public_ip_address" {}
variable "jfrog_nic_private_ip" {}

variable "sonarqube_public_ip_id" {}
variable "sonarqube_public_ip_address" {}
variable "sonarqube_nic_private_ip" {}

variable "platform_public_ip_id" {}
variable "platform_public_ip_address" {}
variable "platform_nic_private_ip" {}

variable "jenkins_public_ip_id" {}
variable "jenkins_public_ip_address" {}
variable "jenkins_nic_private_ip" {}

variable "jira_public_ip_id" {}
variable "jira_public_ip_address" {}
variable "jira_nic_private_ip" {}

variable "ghe_public_ip_id" {}
variable "ghe_public_ip_address" {}
variable "ghe_nic_private_ip" {}

variable "network_address_space" {
  type      = string
}

#Bastion Host Subnet
variable "bh_subnet_id" {}
#Bitdefender Subnet
variable "bitdefender_subnet_id" {}
#jFrog Subnet
variable "jfrog_subnet_id" {}
#Github Enterprise Subnet
variable "ghe_subnet_id" {}
#Jira Subnet
variable "jira_subnet_id" {}
#Jenkins Subnet
variable "jenkins_subnet_id" {}
#Sonarqube Subnet
variable "sonarqube_subnet_id" {}
#Selenium Subnet
variable "selenium_subnet_id" {}
#Ansible Subnet
variable "ansible_subnet_id" {}
#SQL Server Subnet
variable "sqlserver_subnet_id" {}
#platform Subnet
variable "platform_subnet_id" {}
#Redis Cache Subnet
variable "rediscache_subnet_id" {}
#Semmle Subnet
variable "semmle_subnet_id" {}