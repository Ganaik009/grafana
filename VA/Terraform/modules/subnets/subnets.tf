#Azure Firewall subnet
resource "azurerm_subnet" "azurefirewallsubnet" {
   name                      = "AzureFirewallSubnet"
   resource_group_name       = var.network_rg_name
   virtual_network_name      = var.virtual_network_name
   address_prefixes          = [var.azurefirewallsubnet_prefixes]
   service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}

#gateway subnet
resource "azurerm_subnet" "gatewaysubnet" {
   name                      = "GatewaySubnet"
   resource_group_name       = var.network_rg_name
   virtual_network_name      = var.virtual_network_name
   address_prefixes          = [var.gatewaysubnet_prefixes]
   service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}

#Bastion Host subnet
resource "azurerm_subnet" "bh_subnet" {
   name                      = var.bh_subnet_name
   resource_group_name       = var.network_rg_name
   virtual_network_name      = var.virtual_network_name
   address_prefixes          = [var.bh_subnet_prefixes]
   service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}

#Bitdefender subnet
resource "azurerm_subnet" "bitdefender_subnet" {
   name                      = var.bitdefender_subnet_name
   resource_group_name       = var.network_rg_name
   virtual_network_name      = var.virtual_network_name
   address_prefixes          = [var.bitdefender_subnet_prefixes]
   service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}

#jFrog subnet
resource "azurerm_subnet" "jfrog_subnet" {
   name                      = var.jfrog_subnet_name
   resource_group_name       = var.network_rg_name
   virtual_network_name      = var.virtual_network_name
   address_prefixes          = [var.jfrog_subnet_prefixes]
   service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}

#ghe subnet
resource "azurerm_subnet" "ghe_subnet" {
   name                      = var.ghe_subnet_name
   resource_group_name       = var.network_rg_name
   virtual_network_name      = var.virtual_network_name
   address_prefixes          = [var.ghe_subnet_prefixes]
   service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}

#jira subnet
resource "azurerm_subnet" "jira_subnet" {
   name                      = var.jira_subnet_name
   resource_group_name       = var.network_rg_name
   virtual_network_name      = var.virtual_network_name
   address_prefixes          = [var.jira_subnet_prefixes]
   service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}

#jenkins subnet
resource "azurerm_subnet" "jenkins_subnet" {
   name                      = var.jenkins_subnet_name
   resource_group_name       = var.network_rg_name
   virtual_network_name      = var.virtual_network_name
   address_prefixes          = [var.jenkins_subnet_prefixes]
   service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}

#sonarqube subnet
resource "azurerm_subnet" "sonarqube_subnet" {
   name                      = var.sonarqube_subnet_name
   resource_group_name       = var.network_rg_name
   virtual_network_name      = var.virtual_network_name
   address_prefixes          = [var.sonarqube_subnet_prefixes]
   service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}

#selenium subnet
resource "azurerm_subnet" "selenium_subnet" {
   name                      = var.selenium_subnet_name
   resource_group_name       = var.network_rg_name
   virtual_network_name      = var.virtual_network_name
   address_prefixes          = [var.selenium_subnet_prefixes]
   service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}

#ansible subnet
resource "azurerm_subnet" "ansible_subnet" {
   name                      = var.ansible_subnet_name
   resource_group_name       = var.network_rg_name
   virtual_network_name      = var.virtual_network_name
   address_prefixes          = [var.ansible_subnet_prefixes]
   service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}

#sqlserver subnet
resource "azurerm_subnet" "sqlserver_subnet" {
   name                      = var.sqlserver_subnet_name
   resource_group_name       = var.network_rg_name
   virtual_network_name      = var.virtual_network_name
   address_prefixes          = [var.sqlserver_subnet_prefixes]
   service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}

#platform subnet
resource "azurerm_subnet" "platform_subnet" {
   name                      = var.platform_subnet_name
   resource_group_name       = var.network_rg_name
   virtual_network_name      = var.virtual_network_name
   address_prefixes          = [var.platform_subnet_prefixes]
   service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}

#rediscache subnet
resource "azurerm_subnet" "rediscache_subnet" {
   name                      = var.rediscache_subnet_name
   resource_group_name       = var.network_rg_name
   virtual_network_name      = var.virtual_network_name
   address_prefixes          = [var.rediscache_subnet_prefixes]
   service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}

#semmle subnet
resource "azurerm_subnet" "semmle_subnet" {
   name                      = var.semmle_subnet_name
   resource_group_name       = var.network_rg_name
   virtual_network_name      = var.virtual_network_name
   address_prefixes          = [var.semmle_subnet_prefixes]
   service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}