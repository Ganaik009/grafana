#place holder

output "aa_name" {
  value = azurerm_automation_account.aa.name
}

output "aa_id" {
  value = azurerm_automation_account.aa.id
}

output "dsc_server_endpoint" {
  value = azurerm_automation_account.aa.dsc_server_endpoint
}

output "aa_dsc_primary_access_key" {
  value = azurerm_automation_account.aa.dsc_primary_access_key
}

output "aa_dsc_secondary_access_key" {
  value = azurerm_automation_account.aa.dsc_secondary_access_key
}