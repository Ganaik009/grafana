variable "main_rg_name" {}
variable "location" {}
variable "rediscache_name" {
  description = "rediscache name"
}
variable "rediscache_sku" {
  description = "rediscache sku"
}
variable "rediscache_ssl_port" {
  description = "SSL Port"
}
variable "rediscache_subnet_id" {}
variable "rediscache_capacity" {}
variable "rediscache_family" {}