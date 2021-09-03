# Create virtual network
resource "azurerm_virtual_network" "virtual_network" {
    name                = var.network_name
    address_space       = [var.network_address_space]
    location            = var.location
    resource_group_name = var.network_rg_name

    # tags = {
    #     environment = var.environment_tag
    # }
}

# Create subnet
# resource "azurerm_subnet" "AzureFirewallSubnet" {
#    #count                     = length(var.subnet_address_names)
#    name                      = "AzureFirewallSubnet"
#    resource_group_name       = var.network_rg_name
#    virtual_network_name      = azurerm_virtual_network.virtual_network.name
#    address_prefixes          = var.firewall_subnet_prefixes
#    service_endpoints         = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
#    lifecycle {
#      ignore_changes = all
#    }
# }