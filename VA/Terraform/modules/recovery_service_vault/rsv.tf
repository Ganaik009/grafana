resource "azurerm_recovery_services_vault" "rsv" {
  name                = var.rsv_name
  location            = var.location
  resource_group_name = var.utilities_rg_name
  sku                 = "Standard"
  soft_delete_enabled = false
}

resource "azurerm_backup_policy_vm" "backup_policy" {
  name                = var.backup_policy_name
  resource_group_name = var.utilities_rg_name
  recovery_vault_name = azurerm_recovery_services_vault.rsv.name
  timezone            = var.backup_policy_timezone

  backup {
    frequency = var.backup_policy_frequency
    time      = var.backup_policy_time
    }

  retention_daily {
    count = var.backup_retention_daily_count
  }
  retention_weekly {
    weekdays = [var.backup_retention_weekly_weekdays]
    count    = var.backup_retention_weekly_count
  }
  

  retention_monthly {
    weeks    = [var.backup_retention_monthly_weeks]
    weekdays = [var.backup_retention_monthly_weekdays]
    count    = var.backup_retention_monthly_count
  }

  retention_yearly {
    months   = [var.backup_retention_yearly_months]
    weeks    = [var.backup_retention_yearly_weeks]
    weekdays = [var.backup_retention_yearly_weekdays]
    count    = var.backup_retention_yearly_count
  }
}
  # resource "azurerm_backup_protected_vm" "bastionhost" {
  # resource_group_name = var.utilities_rg_name
  # recovery_vault_name = azurerm_recovery_services_vault.rsv.name
  # source_vm_id        = var.bh_vm_id
  # backup_policy_id    = azurerm_backup_policy_vm.backup_policy.id
  # }