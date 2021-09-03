resource "azurerm_storage_account" "stshared" {
  name                     = var.stshared_name
  location                 = var.location
  resource_group_name      = var.utilities_rg_name
  account_tier             = var.stshared_account_tier
  access_tier              = var.stshared_access_tier
  account_replication_type = var.stshared_replication_type
  enable_https_traffic_only = true
  #min_tls_version           = "TLS1_2"
}

resource "azurerm_storage_account" "stdiag" {
  name                     = var.stdiag_name
  location                 = var.location
  resource_group_name      = var.utilities_rg_name
  account_tier             = var.stdiag_account_tier
  access_tier              = var.stdiag_access_tier
  account_replication_type = var.stdiag_replication_type
  enable_https_traffic_only = true
  #min_tls_version           = "TLS1_2"
}

resource "azurerm_storage_account" "stnetdiag" {
  name                     = var.stnetdiag_name
  location                 = var.location
  resource_group_name      = var.utilities_rg_name
  account_tier             = var.stnetdiag_account_tier
  access_tier              = var.stnetdiag_access_tier
  account_replication_type = var.stnetdiag_replication_type
  enable_https_traffic_only = true
  #min_tls_version           = "TLS1_2"
}

resource "azurerm_storage_account" "stjfrog" {
  name                     = var.stjfrog_name
  location                 = var.location
  resource_group_name      = var.utilities_rg_name
  account_tier             = var.stjfrog_account_tier
  access_tier              = var.stjfrog_access_tier
  account_replication_type = var.stjfrog_replication_type
  enable_https_traffic_only = true
  #min_tls_version           = "TLS1_2"
}
# resource "azurerm_storage_queue" "storage_queue" {
#   count                = "${var.use_storage_queue}"
#   name                 = "${var.stshared_name}-queue"
#   resource_group_name  = var.utilities_rg_name
#   stshared_name = "${azurerm_storage_account.storage_account.name}"
# }

# resource "azurerm_storage_share" "storage_share" {
#   count                = "${var.use_storage_share}"
#   name                 = "${var.stshared_name}-share"
#   resource_group_name  = var.utilities_rg_name
#   stshared_name = "${azurerm_storage_account.storage_account.name}"
# }

# resource "azurerm_storage_table" "storage_tables" {
#   count                = "${var.storage_tables_number}"
#   name                 = "${var.stshared_name}table${count.index}"
#   resource_group_name  = var.utilities_rg_name
#   stshared_name = "${azurerm_storage_account.storage_account.name}"
# }

resource "azurerm_storage_container" "storage_container" {
  # count                 = length(var.storage_container_name)
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.stshared.name
  container_access_type = var.storage_container_access_type
}



resource "azurerm_storage_blob" "bitdefender_blob" {
  depends_on = [ azurerm_storage_container.storage_container ]
 name                   = "bitdefender_blob.vhd"
  storage_account_name   = azurerm_storage_account.stshared.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type                   = "Page"
  parallelism            = "16" 
  #size                   = "5120" 
  source_uri             = var.bitdefender_blob_source_uri
  timeouts      { create = "60m"}    
}

# resource "azurerm_storage_blob" "storage_blob" {
#   count                  = "${length(var.storage_blob_sizes)}"
#   name                   = "${var.stshared_name}-blob-${count.index}"
#   resource_group_name    = var.utilities_rg_name
#   stshared_name   = "${azurerm_storage_account.storage_account.name}"
#   storage_container_name = "${azurerm_storage_container.storage_container.name}"
#   type                   = "${var.storage_blob_types[count.index]}"
#   size                   = "${var.storage_blob_sizes[count.index]}"
# }