resource "azurerm_network_interface" "bitdefender_nic" {
  name                       = var.bitdefender_nic_name
  location                   = var.location
  resource_group_name        = var.network_rg_name

    ip_configuration {
    name                          = "${var.bitdefender_nic_name}-ipconfig"
    subnet_id                     = var.bitdefender_subnet_id
    private_ip_address_allocation = "dynamic"
    }
}

resource "azurerm_virtual_machine" "bitdefender" {
  name                = var.bitdefender_vm_name
  resource_group_name = var.main_rg_name
  location            = var.location
  vm_size             = var.bitdefender_vm_size
  # admin_username      = var.linux_vm_admin_username
  network_interface_ids = [
    azurerm_network_interface.bitdefender_nic.id,
  ]

  # admin_ssh_key {
  #   username = var.linux_vm_admin_username
  #   public_key = file("~/.ssh/id_rsa.pub")
  #   }


  storage_os_disk {
    name              = var.bitdefender_os_disk_name
    caching           = "ReadWrite"
    create_option     = "Attach"
    os_type           = "Linux"
    vhd_uri           = var.bitdefender_blob_vhd_uri
    #managed_disk_type = "Standard_LRS"
  }
  boot_diagnostics {
    enabled             = true
    storage_uri = var.stdiag_primary_blob
   }
}
resource "null_resource" "deallocate_vm" {
  depends_on            = [azurerm_virtual_machine.bitdefender]
  provisioner "local-exec" {
    command = "az vm deallocate --resource-group ${var.main_rg_name} --name ${var.bitdefender_vm_name}"
  }
}
resource "null_resource" "convert_vm" {
  depends_on            = [null_resource.deallocate_vm]
  provisioner "local-exec" {
    command = "az vm convert --resource-group ${var.main_rg_name} --name ${var.bitdefender_vm_name}"
  }
}
resource "null_resource" "start_vm" {
  depends_on            = [null_resource.convert_vm]
  provisioner "local-exec" {
    command = "az vm start --resource-group ${var.main_rg_name} --name ${var.bitdefender_vm_name}"
  }
}
