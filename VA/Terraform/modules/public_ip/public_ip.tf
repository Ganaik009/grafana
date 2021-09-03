#Azure Firewall PIP
resource "azurerm_public_ip" "firewall_public_ip" {
   name                      = var.firewall_public_ip_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
   allocation_method         = "Static"         
   sku                       = "Standard"
}

#platform PIP
resource "azurerm_public_ip" "platform_public_ip" {
   depends_on = [azurerm_public_ip.firewall_public_ip]
   name                      = var.platform_public_ip_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
   allocation_method         = "Static"         
   sku                       = "Standard"
}

#jira PIP
resource "azurerm_public_ip" "jira_public_ip" {
   depends_on = [azurerm_public_ip.platform_public_ip]
   name                      = var.jira_public_ip_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
   allocation_method         = "Static"         
   sku                       = "Standard"
}

#jenkins PIP
resource "azurerm_public_ip" "jenkins_public_ip" {
   depends_on = [azurerm_public_ip.jira_public_ip]
   name                      = var.jenkins_public_ip_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
   allocation_method         = "Static"         
   sku                       = "Standard"
}

#ghe PIP
resource "azurerm_public_ip" "ghe_public_ip" {
   depends_on = [azurerm_public_ip.jenkins_public_ip]
   name                      = var.ghe_public_ip_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
   allocation_method         = "Static"         
   sku                       = "Standard"
}

#jfrog PIP
resource "azurerm_public_ip" "jfrog_public_ip" {
   depends_on = [azurerm_public_ip.ghe_public_ip]
   name                      = var.jfrog_public_ip_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
   allocation_method         = "Static"         
   sku                       = "Standard"
}

#sonarqube PIP
resource "azurerm_public_ip" "sonarqube_public_ip" {
   depends_on = [azurerm_public_ip.jfrog_public_ip]
   name                      = var.sonarqube_public_ip_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
   allocation_method         = "Static"         
   sku                       = "Standard"
}
