variable "main_rg_name" {
  description = "The name of the resource group"
 }
variable "network_rg_name" {
  description = "The name of the resource group"
 }
 variable "utilities_rg_name" {
  description = "The name of the resource group"
 }
# Region prefix
variable "location_prefix" {
  description = "VA, TX, EUS etc"
}

# Log Analytic
variable "la_name" {
  description = "Log Analytic Work Space name. Must be unique accross subscription"
}

#Virtual Network
variable "network_name" {
  description = "Virtual Network Name"
}

#Storage Accounts

variable "stjfrog_name" {
  description = "The name of the storage account"
}

variable "stnetdiag_name" {
  description = "The name of the storage account"
}

variable "stdiag_name" {
  description = "The name of the storage account"
}

variable "stshared_name" {
  description = "The name of the storage account"
}

# Recovery Service Vault Name

variable "rsv_name" {
  type        = string
  description = "recovery service vault name"
}

#Rediscache Name
# variable "rediscache_name" {
#   description = "rediscache name"
# }
# KeyVault Name
variable "kv_name" {
  type        = string
  description = "recovery service vault name"
}

#Automation Account
variable "aa_name" {}

# Instance Names
variable "bh_instance_name" {}
variable "jfrog_instance_name" {}
variable "ghe_instance_name" {}
variable "jenkins_instance_name" {}
variable "jenkins_windows_01_instance_name" {}
variable "jenkins_linux_01_instance_name" {}
variable "jenkins_linux_02_instance_name" {}
variable "jira_instance_name" {}
variable "platform_instance_name" {}
variable "sqlserver_instance_name" {}
variable "bitdefender_instance_name" {}
variable "sonarqube_instance_name" {}
variable "sh_instance_name" {}
variable "si_instance_name" {}
variable "sc_instance_name" {}
variable "sf_instance_name" {}
variable "ansible_instance_name" {}
variable "semmle_instance_name" {}
variable "semmle_windows_01_instance_name" {}

variable "rediscache_name" {}