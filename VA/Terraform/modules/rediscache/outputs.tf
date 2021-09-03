output "rediscache_primary_access_key" {
  value = azurerm_redis_cache.rediscache.primary_access_key
}

output "rediscache_primary_connection_string" {
  value = azurerm_redis_cache.rediscache.primary_connection_string
}

output "rediscache_hostname" {
  value = azurerm_redis_cache.rediscache.hostname
}

output "rediscache_private_static_ip_address" {
  value = azurerm_redis_cache.rediscache.private_static_ip_address
}

