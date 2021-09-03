resource "azurerm_resource_group" "main_rg" {
  name     = var.main_rg_name
  location = var.location
}
resource "azurerm_resource_group" "network_rg" {
  name     = var.network_rg_name
  location = var.location
}
resource "azurerm_resource_group" "utilities_rg" {
  name     = var.utilities_rg_name
  location = var.location
}
