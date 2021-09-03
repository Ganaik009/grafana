variable "location" {}
variable "network_rg_name" {}
variable "main_rg_name" {}

variable "semmle_nic_name" {}
variable "semmle_subnet_id" {}

variable "semmle_vm_name" {}
variable "semmle_vm_size" {}
variable "linux_vm_admin_username" {}
variable "semmle_ssh_public_key_path" {}
variable "semmle_os_disk_name" {}
variable "semmle_vm_os_disk_caching" {}
variable "semmle_vm_os_disk_storage_account_type" {}

variable "semmle_vm_source_image_publisher" {}
variable "semmle_vm_source_image_offer" {}
variable "semmle_vm_source_image_sku" {}
variable "semmle_vm_source_image_version" {}

variable "semmle_vm_plan_name" {}
variable "semmle_vm_plan_product" {}
variable "semmle_vm_plan_publisher" {}


variable "stdiag_primary_blob" {}

variable "utilities_rg_name" {}
variable "rsv_name" {}
variable "backup_policy_id" {}
