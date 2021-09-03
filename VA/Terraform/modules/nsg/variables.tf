variable "network_rg_name" {
  type        = string
  description = "The name of the Network resource group"
}


variable "location" {
  type        = string
  description = "The name of the Network resource group"
}
###----NSG Names
variable "bh_nsg_name" {
  type        = string
  description = "The name of the Network resource group"
}

variable "jfrog_nsg_name" {}
variable "ghe_nsg_name" {}
variable "jenkins_nsg_name" {}
variable "jira_nsg_name" {}
variable "platform_nsg_name" {}
variable "sqlserver_nsg_name" {}
variable "bitdefender_nsg_name" {}
variable "sonarqube_nsg_name" {}
variable "selenium_nsg_name" {}
variable "ansible_nsg_name" {}
variable "rediscache_nsg_name" {}
variable "semmle_nsg_name" {}