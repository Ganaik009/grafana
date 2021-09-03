

variable "network_rg_name" {
  type        = string
  description = "The name of the Network resource group"
}

variable "location" {
  type        = string
  description = "The location in which the Network resource group will be created"
}

variable "dns_zone_name" {
  type        = string
  description = "Virtual Network Name"
}
 
variable "virtual_network_id" {}

variable "bh_dns_prefix" {}
variable "bh_nic_private_ip" {}

variable "jfrog_dns_prefix" {}
variable "jfrog_nic_private_ip" {}

variable "ghe_dns_prefix" {}
variable "ghe_nic_private_ip" {}

variable "jenkins_dns_prefix" {}
variable "jenkins_nic_private_ip" {}

variable "jenkins_windows_01_dns_prefix" {}
variable "jenkins_windows_01_nic_private_ip" {}

variable "jenkins_linux_01_dns_prefix" {}
variable "jenkins_linux_01_nic_private_ip" {}

variable "jenkins_linux_02_dns_prefix" {}
variable "jenkins_linux_02_nic_private_ip" {}

variable "jira_dns_prefix" {}
variable "jira_nic_private_ip" {}

variable "platform_dns_prefix" {}
variable "platform_nic_private_ip" {}

variable "sqlserver_dns_prefix" {}
variable "sqlserver_nic_private_ip" {}

variable "bitdefender_dns_prefix" {}
variable "bitdefender_nic_private_ip" {}

variable "sh_dns_prefix" {}
variable "sh_nic_private_ip" {}

variable "si_dns_prefix" {}
variable "si_nic_private_ip" {}

variable "sc_dns_prefix" {}
variable "sc_nic_private_ip" {}

variable "sf_dns_prefix" {}
variable "sf_nic_private_ip" {}

variable "sonarqube_dns_prefix" {}
variable "sonarqube_nic_private_ip" {}

variable "ansible_dns_prefix" {}
variable "ansible_nic_private_ip" {}

variable "semmle_dns_prefix" {}
variable "semmle_nic_private_ip" {}

variable "semmle_windows_01_dns_prefix" {}
variable "semmle_windows_01_nic_private_ip" {}
