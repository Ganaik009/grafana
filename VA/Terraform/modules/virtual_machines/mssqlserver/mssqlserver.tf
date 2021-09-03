resource "azurerm_network_interface" "sqlserver_nic" {
  name                       = var.sqlserver_nic_name
  location                   = var.location
  resource_group_name        = var.network_rg_name
  
    ip_configuration {
    name                          = "${var.sqlserver_nic_name}-ipconfig"
    subnet_id                     = var.sqlserver_subnet_id
    private_ip_address_allocation = "dynamic"
    }
}

resource "azurerm_windows_virtual_machine" "sqlserver" {
  name                = var.sqlserver_vm_name
  resource_group_name = var.main_rg_name
  location            = var.location
  size                = var.sqlserver_vm_size
  admin_username      = var.windows_vm_admin_username
  admin_password      = var.sqlserver_admin_password
  network_interface_ids = [azurerm_network_interface.sqlserver_nic.id]
  computer_name       = var.sqlserver_vm_name
  os_disk {
    name                 = var.sqlserver_os_disk_name
    caching              = var.sqlserver_vm_os_disk_caching
    storage_account_type = var.sqlserver_vm_os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.sqlserver_vm_source_image_publisher
    offer     = var.sqlserver_vm_source_image_offer
    sku       = var.sqlserver_vm_source_image_sku
    version   = var.sqlserver_vm_source_image_version
  }
     boot_diagnostics {
       storage_account_uri = var.stdiag_primary_blob
   }
}
resource "azurerm_managed_disk" "sqlserver_data_disk01" {
  depends_on             = [azurerm_windows_virtual_machine.sqlserver]
  name                    = var.sqlserver_data_disk01_name
  location                = var.location
  resource_group_name     = var.main_rg_name
  storage_account_type    = var.sqlserver_vm_data_disk01_storage_account_type
  create_option           = "Empty"
  disk_size_gb            = var.sqlserver_vm_data_disk01_size_gb
}

resource "azurerm_virtual_machine_data_disk_attachment" "sqlserver_data_disk01_attachment" {
  depends_on = [azurerm_virtual_machine_data_disk_attachment.sqlserver_data_disk01_attachment]
  managed_disk_id    = azurerm_managed_disk.sqlserver_data_disk01.id
  virtual_machine_id = azurerm_windows_virtual_machine.sqlserver.id
  lun                = var.sqlserver_vm_data_disk01_lun
  caching            = var.sqlserver_vm_data_disk01_caching
}

# resource "azurerm_managed_disk" "sqlserver_data_disk02" {
#   name                    = var.sqlserver_data_disk02_name
#   location                = var.location
#   resource_group_name     = var.main_rg_name
#   storage_account_type    = var.sqlserver_vm_data_disk02_storage_account_type
#   create_option           = "Empty"
#   disk_size_gb            = var.sqlserver_vm_data_disk02_size_gb
# }

# resource "azurerm_virtual_machine_data_disk_attachment" "sqlserver_data_disk02_attachment" {
#   managed_disk_id    = azurerm_managed_disk.sqlserver_data_disk02.id
#   virtual_machine_id = azurerm_windows_virtual_machine.sqlserver.id
#   lun                = var.sqlserver_vm_data_disk02_lun
#   caching            = var.sqlserver_vm_data_disk02_caching
# }



resource "azurerm_mssql_virtual_machine" "mssqlserver" {
  virtual_machine_id               = azurerm_windows_virtual_machine.sqlserver.id
  sql_license_type                 = var.sql_license_type
  r_services_enabled               = var.r_services_enabled 
  sql_connectivity_port            = var.sql_connectivity_port  
  sql_connectivity_type            = var.sql_connectivity_type  
  sql_connectivity_update_password = var.sql_connectivity_update_password
  sql_connectivity_update_username = var.sql_connectivity_update_username

  auto_patching {
    day_of_week                            = var.sql_maintenance_day_of_week
    maintenance_window_duration_in_minutes = var.sql_maintenance_window_duration_in_minutes
    maintenance_window_starting_hour       = var.sql_maintenance_window_starting_hour
  }

  storage_configuration {
    disk_type                   = "NEW"
    storage_workload_type       = "OLTP"
    
  }

}
  resource "azurerm_backup_protected_vm" "vm_backup" {
  resource_group_name = var.utilities_rg_name
  recovery_vault_name = var.rsv_name
  source_vm_id        = azurerm_windows_virtual_machine.sqlserver.id
  backup_policy_id    = var.backup_policy_id
}