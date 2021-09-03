

#Tags
# variable "tags" {
#   type        = string
#   description = "Tag value for Environment"
# }

# Log analytic configuration

variable "la_name" {
  type        = string
  description = "log analytics name"
}

variable "la_sku" {
  type        = string
  description = "log analytics sku"
}

variable "la_retention_in_days" {
  description = "log analytics retention in days"
}
variable "utilities_rg_name" {

}

variable "location" {

}

# variable "bootdiagnostics_storage_diag_name" {
#   type        = string
#   description = "Storage Account name for Diagnostics"
# }