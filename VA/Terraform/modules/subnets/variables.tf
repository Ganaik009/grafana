variable "network_rg_name" {
  type        = string
  description = "The name of the Network resource group"
}

variable "virtual_network_name" {
  type        = string
  description = "Output from the virtual network module. virtual_network_name"
}
#Subnets
#Firewall and Gateway
variable "azurefirewallsubnet_prefixes" {
description = "List of address prefixes for the subnets"
}

variable "gatewaysubnet_prefixes" {
  description = "List of address prefixes for the subnets"
}

#Bastion Host
variable "bh_subnet_name" {
  description = "BH Subnet Name"
}
variable "bh_subnet_prefixes" {
  description = "BH Subnet CIDR"
}

#Bitdefender
variable "bitdefender_subnet_name" {
  description = "bitdefender Subnet Name"
}
variable "bitdefender_subnet_prefixes" {
  description = "bitdefender Subnet CIDR"
}

#jfrog
variable "jfrog_subnet_name" {
  description = "jfrog Subnet Name"
}
variable "jfrog_subnet_prefixes" {
  description = "jfrog Subnet CIDR"
}

#ghe
variable "ghe_subnet_name" {
  description = "ghe Subnet Name"
}
variable "ghe_subnet_prefixes" {
  description = "ghe Subnet CIDR"
}

#jira
variable "jira_subnet_name" {
  description = "jira Subnet Name"
}
variable "jira_subnet_prefixes" {
  description = "jira Subnet CIDR"
}

#jenkins
variable "jenkins_subnet_name" {
  description = "jenkins Subnet Name"
}
variable "jenkins_subnet_prefixes" {
  description = "jenkins Subnet CIDR"
}

#sonarqube
variable "sonarqube_subnet_name" {
  description = "sonarqube Subnet Name"
}
variable "sonarqube_subnet_prefixes" {
  description = "sonarqube Subnet CIDR"
}

#selenium
variable "selenium_subnet_name" {
  description = "selenium Subnet Name"
}
variable "selenium_subnet_prefixes" {
  description = "selenium Subnet CIDR"
}

#ansible
variable "ansible_subnet_name" {
  description = "ansible Subnet Name"
}
variable "ansible_subnet_prefixes" {
  description = "ansible Subnet CIDR"
}

#sqlserver
variable "sqlserver_subnet_name" {
  description = "sqlserver Subnet Name"
}
variable "sqlserver_subnet_prefixes" {
  description = "sqlserver Subnet CIDR"
}

#platform
variable "platform_subnet_name" {
  description = "platform Subnet Name"
}
variable "platform_subnet_prefixes" {
  description = "platform Subnet CIDR"
}

#rediscache
variable "rediscache_subnet_name" {
  description = "rediscache Subnet Name"
}
variable "rediscache_subnet_prefixes" {
  description = "rediscache Subnet CIDR"
}

#semmle
variable "semmle_subnet_name" {
  description = "semmle Subnet Name"
}
variable "semmle_subnet_prefixes" {
  description = "semmle Subnet CIDR"
}


