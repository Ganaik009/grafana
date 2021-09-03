#Bastion Host NSG
resource "azurerm_network_security_group" "bh_nsg" {
   name                      = var.bh_nsg_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
}
resource "azurerm_network_security_rule" "predefined_bh_nsg_rules" {
  for_each                    = local.predefined_windows_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name
  network_security_group_name = azurerm_network_security_group.bh_nsg.name
}
resource "azurerm_network_security_rule" "custom_bh_nsg_rules" {
  for_each                    = local.custom_bh_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name 
  network_security_group_name = azurerm_network_security_group.bh_nsg.name
}

#jFrog NSG
resource "azurerm_network_security_group" "jfrog_nsg" {
   name                      = var.jfrog_nsg_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
}
resource "azurerm_network_security_rule" "predefined_jfrog_nsg_rules" {
  for_each                    = local.predefined_windows_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name
  network_security_group_name = azurerm_network_security_group.jfrog_nsg.name
}
resource "azurerm_network_security_rule" "custom_jfrog_nsg_rules" {
  for_each                    = local.custom_jfrog_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name 
  network_security_group_name = azurerm_network_security_group.jfrog_nsg.name
}

#ghe NSG
resource "azurerm_network_security_group" "ghe_nsg" {
   name                      = var.ghe_nsg_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
}
resource "azurerm_network_security_rule" "predefined_ghe_nsg_rules" {
  for_each                    = local.predefined_linux_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name
  network_security_group_name = azurerm_network_security_group.ghe_nsg.name
}
resource "azurerm_network_security_rule" "custom_ghe_nsg_rules" {
  for_each                    = local.custom_ghe_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name 
  network_security_group_name = azurerm_network_security_group.ghe_nsg.name
}

#jenkins NSG
resource "azurerm_network_security_group" "jenkins_nsg" {
   name                      = var.jenkins_nsg_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
}
resource "azurerm_network_security_rule" "predefined_jenkins_nsg_rules" {
  for_each                    = local.predefined_linux_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name
  network_security_group_name = azurerm_network_security_group.jenkins_nsg.name
}
resource "azurerm_network_security_rule" "custom_jenkins_nsg_rules" {
  for_each                    = local.custom_jenkins_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name 
  network_security_group_name = azurerm_network_security_group.jenkins_nsg.name
}

#jira NSG
resource "azurerm_network_security_group" "jira_nsg" {
   name                      = var.jira_nsg_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
}
resource "azurerm_network_security_rule" "predefined_jira_nsg_rules" {
  for_each                    = local.predefined_linux_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name
  network_security_group_name = azurerm_network_security_group.jira_nsg.name
}
resource "azurerm_network_security_rule" "custom_jira_nsg_rules" {
  for_each                    = local.custom_jira_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name 
  network_security_group_name = azurerm_network_security_group.jira_nsg.name
}

#platform NSG
resource "azurerm_network_security_group" "platform_nsg" {
   name                      = var.platform_nsg_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
}
resource "azurerm_network_security_rule" "predefined_platform_nsg_rules" {
  for_each                    = local.predefined_linux_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name
  network_security_group_name = azurerm_network_security_group.platform_nsg.name
}
resource "azurerm_network_security_rule" "custom_platform_nsg_rules" {
  for_each                    = local.custom_platform_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name 
  network_security_group_name = azurerm_network_security_group.platform_nsg.name
}

#sqlserver NSG
resource "azurerm_network_security_group" "sqlserver_nsg" {
   name                      = var.sqlserver_nsg_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
}
resource "azurerm_network_security_rule" "predefined_sqlserver_nsg_rules" {
  for_each                    = local.predefined_windows_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name
  network_security_group_name = azurerm_network_security_group.sqlserver_nsg.name
}
resource "azurerm_network_security_rule" "custom_sqlserver_nsg_rules" {
  for_each                    = local.custom_sqlserver_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name 
  network_security_group_name = azurerm_network_security_group.sqlserver_nsg.name
}

#bitdefender NSG
resource "azurerm_network_security_group" "bitdefender_nsg" {
   name                      = var.bitdefender_nsg_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
}
resource "azurerm_network_security_rule" "predefined_bitdefender_nsg_rules" {
  for_each                    = local.predefined_linux_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name
  network_security_group_name = azurerm_network_security_group.bitdefender_nsg.name
}
resource "azurerm_network_security_rule" "custom_bitdefender_nsg_rules" {
  for_each                    = local.custom_bitdefender_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name 
  network_security_group_name = azurerm_network_security_group.bitdefender_nsg.name
}

#sonarqube NSG
resource "azurerm_network_security_group" "sonarqube_nsg" {
   name                      = var.sonarqube_nsg_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
}
resource "azurerm_network_security_rule" "predefined_sonarqube_nsg_rules" {
  for_each                    = local.predefined_windows_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name
  network_security_group_name = azurerm_network_security_group.sonarqube_nsg.name
}
resource "azurerm_network_security_rule" "custom_sonarqube_nsg_rules" {
  for_each                    = local.custom_sonarqube_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name 
  network_security_group_name = azurerm_network_security_group.sonarqube_nsg.name
}

#selenium NSG
resource "azurerm_network_security_group" "selenium_nsg" {
   name                      = var.selenium_nsg_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
}
resource "azurerm_network_security_rule" "predefined_selenium_nsg_rules" {
  for_each                    = local.predefined_windows_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name
  network_security_group_name = azurerm_network_security_group.selenium_nsg.name
}
resource "azurerm_network_security_rule" "custom_selenium_nsg_rules" {
  for_each                    = local.custom_selenium_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name 
  network_security_group_name = azurerm_network_security_group.selenium_nsg.name
}

#ansible NSG
resource "azurerm_network_security_group" "ansible_nsg" {
   name                      = var.ansible_nsg_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
}
resource "azurerm_network_security_rule" "predefined_ansible_nsg_rules" {
  for_each                    = local.predefined_linux_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name
  network_security_group_name = azurerm_network_security_group.ansible_nsg.name
}
resource "azurerm_network_security_rule" "custom_ansible_nsg_rules" {
  for_each                    = local.custom_ansible_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name 
  network_security_group_name = azurerm_network_security_group.ansible_nsg.name
}

#semmle NSG
resource "azurerm_network_security_group" "semmle_nsg" {
   name                      = var.semmle_nsg_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
}
resource "azurerm_network_security_rule" "predefined_semmle_nsg_rules" {
  for_each                    = local.predefined_linux_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name
  network_security_group_name = azurerm_network_security_group.semmle_nsg.name
}
resource "azurerm_network_security_rule" "custom_semmle_nsg_rules" {
  for_each                    = local.custom_semmle_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name 
  network_security_group_name = azurerm_network_security_group.semmle_nsg.name
}

#rediscache NSG
resource "azurerm_network_security_group" "rediscache_nsg" {
   name                      = var.rediscache_nsg_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
}

resource "azurerm_network_security_rule" "custom_rediscache_nsg_rules" {
  for_each                    = local.custom_rediscache_nsgrules
  name                        = each.value.name
  direction                   = each.value.direction
  access                      = each.value.access
  priority                    = each.value.priority
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_ranges     = each.value.destination_port_ranges
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = var.network_rg_name 
  network_security_group_name = azurerm_network_security_group.rediscache_nsg.name
}