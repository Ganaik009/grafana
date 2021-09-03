
resource "azurerm_network_interface" "ansible_nic" {
  name                       = var.ansible_nic_name
  location                   = var.location
  resource_group_name        = var.network_rg_name

    ip_configuration {
    name                          = "${var.ansible_nic_name}-ipconfig"
    subnet_id                     = var.ansible_subnet_id
    private_ip_address_allocation = "dynamic"
    }
}

resource "azurerm_linux_virtual_machine" "ansible" {
  name                = var.ansible_vm_name
  resource_group_name = var.main_rg_name
  location            = var.location
  size                = var.ansible_vm_size
  admin_username      = var.linux_vm_admin_username
  network_interface_ids = [
    azurerm_network_interface.ansible_nic.id,
  ]

  admin_ssh_key {
    username = var.linux_vm_admin_username
    public_key = file("~/.ssh/id_rsa.pub")
    # public_key = file("var.ansible_ssh_public_key_path")
  }

  os_disk {
    name                 = var.ansible_os_disk_name
    caching              = var.ansible_vm_os_disk_caching
    storage_account_type = var.ansible_vm_os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.ansible_vm_source_image_publisher
    offer     = var.ansible_vm_source_image_offer
    sku       = var.ansible_vm_source_image_sku
    version   = var.ansible_vm_source_image_version
  }
  plan  {
      name      =  var.ansible_vm_plan_name
      product   =  var.ansible_vm_plan_product
      publisher =  var.ansible_vm_plan_publisher
  }
  

     boot_diagnostics {
       storage_account_uri = var.stdiag_primary_blob
   }
}

resource "azurerm_backup_protected_vm" "vm_backup" {
  depends_on          = [azurerm_linux_virtual_machine.ansible]
  resource_group_name = var.utilities_rg_name
  recovery_vault_name = var.rsv_name
  source_vm_id        = azurerm_linux_virtual_machine.ansible.id
  backup_policy_id    = var.backup_policy_id
  }
