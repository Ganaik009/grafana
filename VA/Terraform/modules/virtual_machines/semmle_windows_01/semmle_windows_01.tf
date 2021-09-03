resource "azurerm_network_interface" "semmle_windows_01_nic" {
  name                       = var.semmle_windows_01_nic_name
  location                   = var.location
  resource_group_name        = var.network_rg_name
  
    ip_configuration {
    name                          = "${var.semmle_windows_01_nic_name}-ipconfig"
    subnet_id                     = var.semmle_subnet_id
    private_ip_address_allocation = "dynamic"
    }
}

resource "azurerm_windows_virtual_machine" "semmle_windows_01" {
  name                = var.semmle_windows_01_vm_name
  resource_group_name = var.main_rg_name
  location            = var.location
  size                = var.semmle_windows_01_vm_size
  admin_username      = var.windows_vm_admin_username
  admin_password      = var.semmle_windows_01_admin_password
  network_interface_ids = [azurerm_network_interface.semmle_windows_01_nic.id]
  computer_name       = var.semmle_windows_01_vm_name
  os_disk {
    name                 = var.semmle_windows_01_os_disk_name
    caching              = var.semmle_windows_01_vm_os_disk_caching
    storage_account_type = var.semmle_windows_01_vm_os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.semmle_windows_01_vm_source_image_publisher
    offer     = var.semmle_windows_01_vm_source_image_offer
    sku       = var.semmle_windows_01_vm_source_image_sku
    version   = var.semmle_windows_01_vm_source_image_version
  }
     boot_diagnostics {
       storage_account_uri = var.stdiag_primary_blob
   }
}
  resource "azurerm_backup_protected_vm" "vm_backup" {
  resource_group_name = var.utilities_rg_name
  recovery_vault_name = var.rsv_name
  source_vm_id        = azurerm_windows_virtual_machine.semmle_windows_01.id
  backup_policy_id    = var.backup_policy_id
  }