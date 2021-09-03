variable "utilities_rg_name" {}
variable "location" {}
variable "kv_name" {}
variable "kv_sku" {}
variable "kv_enable_disk_encryption" {}
variable "kv_enable_soft_delete" {}
variable "kv_soft_delete_retention_days" {}
variable "kv_enable_purge_protection" {}
variable "kv_certificate_permissions" {}
variable "kv_key_permissions" {}
variable "kv_secret_permissions" {}
variable "kv_storage_permissions" {}
variable "kv_network_acls_default_action" {}
variable "kv_network_acls_bypass" {}
variable "tt_support_email" {}
variable "tt_support_name" {}
variable "tt_support_phone" {}
#AzureFirewallSubnet
variable "azurefirewallsubnet_id" {}
#GatewaySubnet
variable "gatewaysubnet_id" {}
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



