resource "azurerm_redis_cache" "rediscache" {
  name                = var.rediscache_name
  location            = var.location
  resource_group_name = var.main_rg_name
  #ssl_port            = var.rediscache_ssl_port
  subnet_id           = var.rediscache_subnet_id
  capacity            = var.rediscache_capacity
  family              = var.rediscache_family
  sku_name            = var.rediscache_sku
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"


  # redis_configuration {
  #   rdb_backup_enabled            = true
  #   rdb_backup_frequency          = 1440
  #   rdb_backup_max_snapshot_count = 1
  #   rdb_storage_connection_string = "${azurerm_storage_account.example.primary_blob_connection_string}"
  # }
}