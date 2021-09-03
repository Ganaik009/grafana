resource "azurerm_automation_account" "aa" {
  name                        = var.aa_name
  location                    = var.location
  resource_group_name         = var.utilities_rg_name
  sku_name                    = var.aa_sku
  #tags                        = var.tags
}
