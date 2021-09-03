#Shared
output "stshared_id" {
  value = azurerm_storage_account.stshared.id
}

output "stshared_name" {
  value = azurerm_storage_account.stshared.name
}

output "stshared_primary_blob" {
  value = azurerm_storage_account.stshared.primary_blob_endpoint
}

output "storage_containers" {
  value = azurerm_storage_container.storage_container.*.name
}

output "bitdefender_blob_vhd_uri" {
  value = azurerm_storage_blob.bitdefender_blob.url
}
#   https://stsharedva.blob.core.usgovcloudapi.net/vhdload/bitdefender_blob.vhd
#Diagnostics
output "stdiag_id" {
  value = azurerm_storage_account.stdiag.id
}

output "stdiag_name" {
  value = azurerm_storage_account.stdiag.name
}

output "stdiag_primary_blob" {
  value = azurerm_storage_account.stdiag.primary_blob_endpoint
}
# Network Diagnostics
output "stnetdiag_id" {
  value = azurerm_storage_account.stnetdiag.id
}

output "stnetdiag_name" {
  value = azurerm_storage_account.stnetdiag.name
}

output "stnetdiag_primary_blob" {
  value = azurerm_storage_account.stnetdiag.primary_blob_endpoint
}
# jFrog
output "stjfrog_id" {
  value = azurerm_storage_account.stdiag.id
}

output "stjfrog_name" {
  value = azurerm_storage_account.stjfrog.name
}

output "stjfrog_primary_blob" {
  value = azurerm_storage_account.stjfrog.primary_blob_endpoint
}