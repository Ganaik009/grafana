variable "location" {}
variable "network_rg_name" {}
variable "main_rg_name" {}

variable "platform_nic_name" {}
variable "platform_subnet_id" {}

variable "platform_vm_name" {}
variable "platform_vm_size" {}
variable "linux_vm_admin_username" {}
variable "platform_ssh_public_key_path" {}
variable "platform_os_disk_name" {}
variable "platform_vm_os_disk_caching" {}
variable "platform_vm_os_disk_storage_account_type" {}

variable "platform_vm_source_image_publisher" {}
variable "platform_vm_source_image_offer" {}
variable "platform_vm_source_image_sku" {}
variable "platform_vm_source_image_version" {}

variable "platform_vm_plan_name" {}
variable "platform_vm_plan_product" {}
variable "platform_vm_plan_publisher" {}


variable "stdiag_primary_blob" {}

variable "utilities_rg_name" {}
variable "rsv_name" {}
variable "backup_policy_id" {}
