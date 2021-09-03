data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  location                    = var.location
  resource_group_name         = var.utilities_rg_name
  name                        = var.kv_name
  sku_name                    = var.kv_sku
  enabled_for_disk_encryption = var.kv_enable_disk_encryption
  soft_delete_enabled         = var.kv_enable_soft_delete
  soft_delete_retention_days  = var.kv_soft_delete_retention_days
  purge_protection_enabled    = var.kv_enable_purge_protection
  
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    certificate_permissions = var.kv_certificate_permissions
    key_permissions = var.kv_key_permissions
    secret_permissions = var.kv_secret_permissions
    storage_permissions = var.kv_storage_permissions
    
     }

  network_acls {
    default_action = var.kv_network_acls_default_action
    bypass         = var.kv_network_acls_bypass
    virtual_network_subnet_ids = [

#AzureFirewallSubnet
var.azurefirewallsubnet_id,

#GatewaySubnet
var.gatewaysubnet_id,


#Bastion Host Subnet
var.bh_subnet_id,

#Bitdefender Subnet
var.bitdefender_subnet_id,


#jFrog Subnet
var.jfrog_subnet_id,

#Github Enterprise Subnet
var.ghe_subnet_id,

#Jira Subnet
var.jira_subnet_id,

#Jenkins Subnet
var.jenkins_subnet_id,

#Sonarqube Subnet
var.sonarqube_subnet_id,

#Selenium Subnet
var.selenium_subnet_id,

#Ansible Subnet
var.ansible_subnet_id,

#SQL Server Subnet
var.sqlserver_subnet_id,

#platform Subnet
var.platform_subnet_id,

#Redis Cache Subnet
var.rediscache_subnet_id,

#Semmle Subnet
var.semmle_subnet_id,

  ]
}

  #contact {
    #email = var.tt_support_email
    #name  = var.tt_support_name
    #phone = var.tt_support_phone
  #}
}  
  #tags                        = var.tags
