resource "azurerm_network_interface" "sonarqube_nic" {
  name                       = var.sonarqube_nic_name
  location                   = var.location
  resource_group_name        = var.network_rg_name
  
    ip_configuration {
    name                          = "${var.sonarqube_nic_name}-ipconfig"
    subnet_id                     = var.sonarqube_subnet_id
    private_ip_address_allocation = "dynamic"
    }
}

resource "azurerm_windows_virtual_machine" "sonarqube" {
  name                = var.sonarqube_vm_name
  resource_group_name = var.main_rg_name
  location            = var.location
  size                = var.sonarqube_vm_size
  admin_username      = var.windows_vm_admin_username
  admin_password      = var.sonarqube_admin_password
  network_interface_ids = [azurerm_network_interface.sonarqube_nic.id]
  computer_name       = var.sonarqube_vm_name
  os_disk {
    name                 = var.sonarqube_os_disk_name
    caching              = var.sonarqube_vm_os_disk_caching
    storage_account_type = var.sonarqube_vm_os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.sonarqube_vm_source_image_publisher
    offer     = var.sonarqube_vm_source_image_offer
    sku       = var.sonarqube_vm_source_image_sku
    version   = var.sonarqube_vm_source_image_version
  }
     boot_diagnostics {
       storage_account_uri = var.stdiag_primary_blob
   }
}
resource "azurerm_managed_disk" "sonarqube_data_disk" {
  name                    = var.sonarqube_data_disk_name
  location                = var.location
  resource_group_name     = var.main_rg_name
  storage_account_type    = var.sonarqube_vm_data_disk_storage_account_type
  create_option           = "Empty"
  disk_size_gb            = var.sonarqube_vm_data_disk_size_gb
}

resource "azurerm_virtual_machine_data_disk_attachment" "sonarqube_data_disk_attachment" {
  managed_disk_id    = azurerm_managed_disk.sonarqube_data_disk.id
  virtual_machine_id = azurerm_windows_virtual_machine.sonarqube.id
  lun                = var.sonarqube_vm_data_disk_lun
  caching            = var.sonarqube_vm_data_disk_caching
}

  resource "azurerm_backup_protected_vm" "vm_backup" {
  resource_group_name = var.utilities_rg_name
  recovery_vault_name = var.rsv_name
  source_vm_id        = azurerm_windows_virtual_machine.sonarqube.id
  backup_policy_id    = var.backup_policy_id
  }