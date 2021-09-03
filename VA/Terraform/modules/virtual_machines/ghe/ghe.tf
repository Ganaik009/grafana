
resource "azurerm_network_interface" "ghe_nic" {
  name                       = var.ghe_nic_name
  location                   = var.location
  resource_group_name        = var.network_rg_name

    ip_configuration {
    name                          = "${var.ghe_nic_name}-ipconfig"
    subnet_id                     = var.ghe_subnet_id
    private_ip_address_allocation = "dynamic"
    }
}

resource "azurerm_linux_virtual_machine" "ghe" {
  name                = var.ghe_vm_name
  resource_group_name = var.main_rg_name
  location            = var.location
  size                = var.ghe_vm_size
  admin_username      = var.linux_vm_admin_username
  network_interface_ids = [
    azurerm_network_interface.ghe_nic.id,
  ]

  admin_ssh_key {
    username = var.linux_vm_admin_username
    public_key = file("~/.ssh/id_rsa.pub")
    # public_key = file("var.ghe_ssh_public_key_path")
  }

  os_disk {
    name                 = var.ghe_os_disk_name
    caching              = var.ghe_vm_os_disk_caching
    storage_account_type = var.ghe_vm_os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.ghe_vm_source_image_publisher
    offer     = var.ghe_vm_source_image_offer
    sku       = var.ghe_vm_source_image_sku
    version   = var.ghe_vm_source_image_version
  }

     boot_diagnostics {
       storage_account_uri = var.stdiag_primary_blob
   }
}
resource "azurerm_managed_disk" "ghe_data_disk" {
  name                    = var.ghe_data_disk_name
  location                = var.location
  resource_group_name     = var.main_rg_name
  storage_account_type    = var.ghe_vm_data_disk_storage_account_type
  create_option           = "Empty"
  disk_size_gb            = var.ghe_vm_data_disk_size_gb
}

resource "azurerm_virtual_machine_data_disk_attachment" "ghe_data_disk_attachment" {
  managed_disk_id    = azurerm_managed_disk.ghe_data_disk.id
  virtual_machine_id = azurerm_linux_virtual_machine.ghe.id
  lun                = var.ghe_vm_data_disk_lun
  caching            = var.ghe_vm_data_disk_caching
}
resource "azurerm_backup_protected_vm" "vm_backup" {
  depends_on = [azurerm_virtual_machine_data_disk_attachment.ghe_data_disk_attachment]
  resource_group_name = var.utilities_rg_name
  recovery_vault_name = var.rsv_name
  source_vm_id        = azurerm_linux_virtual_machine.ghe.id
  backup_policy_id    = var.backup_policy_id
  }
