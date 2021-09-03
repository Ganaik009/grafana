resource "azurerm_backup_protected_vm" "jira_vm_backup" {
  resource_group_name = var.utilities_rg_name
  recovery_vault_name = var.rsv_name
  source_vm_id        = var.jira_vm_id
  backup_policy_id    = var.backup_policy_id
  }

  resource "azurerm_backup_protected_vm" "platform_vm_backup" {
  depends_on          = [azurerm_backup_protected_vm.jira_vm_backup]
  resource_group_name = var.utilities_rg_name
  recovery_vault_name = var.rsv_name
  source_vm_id        = var.platform_vm_id
  backup_policy_id    = var.backup_policy_id
  }

  resource "azurerm_backup_protected_vm" "semmle_vm_backup" {
  depends_on          = [azurerm_backup_protected_vm.platform_vm_backup]
  resource_group_name = var.utilities_rg_name
  recovery_vault_name = var.rsv_name
  source_vm_id        = var.semmle_vm_id
  backup_policy_id    = var.backup_policy_id
  }

  resource "azurerm_backup_protected_vm" "ansible_vm_backup" {
  depends_on          = [azurerm_backup_protected_vm.semmle_vm_backup]
  resource_group_name = var.utilities_rg_name
  recovery_vault_name = var.rsv_name
  source_vm_id        = var.ansible_vm_id
  backup_policy_id    = var.backup_policy_id
  }

  resource "azurerm_backup_protected_vm" "jenkins_vm_backup" {
  depends_on          = [azurerm_backup_protected_vm.ansible_vm_backup]
  resource_group_name = var.utilities_rg_name
  recovery_vault_name = var.rsv_name
  source_vm_id        = var.jenkins_vm_id
  backup_policy_id    = var.backup_policy_id
  }

  resource "azurerm_backup_protected_vm" "jenkins_linux_01_vm_backup" {
  depends_on          = [azurerm_backup_protected_vm.jenkins_vm_backup]
  resource_group_name = var.utilities_rg_name
  recovery_vault_name = var.rsv_name
  source_vm_id        = var.jenkins_linux_01_vm_id
  backup_policy_id    = var.backup_policy_id
  }

  resource "azurerm_backup_protected_vm" "jenkins_linux_02_vm_backup" {
  depends_on          = [azurerm_backup_protected_vm.jenkins_linux_01_vm_backup]
  resource_group_name = var.utilities_rg_name
  recovery_vault_name = var.rsv_name
  source_vm_id        = var.jenkins_linux_02_vm_id
  backup_policy_id    = var.backup_policy_id
  }

  # resource "azurerm_backup_protected_vm" "bitdefender_vm_backup" {
  # depends_on          = [azurerm_backup_protected_vm.jenkins_linux_02_vm_backup]
  # resource_group_name = var.utilities_rg_name
  # recovery_vault_name = var.rsv_name
  # source_vm_id        = var.bitdefender_vm_id
  # backup_policy_id    = var.backup_policy_id
  # }