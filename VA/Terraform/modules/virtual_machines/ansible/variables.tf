variable "location" {}
variable "network_rg_name" {}
variable "main_rg_name" {}

variable "ansible_nic_name" {}
variable "ansible_subnet_id" {}

variable "ansible_vm_name" {}
variable "ansible_vm_size" {}
variable "linux_vm_admin_username" {}
variable "ansible_ssh_public_key_path" {}
variable "ansible_os_disk_name" {}
variable "ansible_vm_os_disk_caching" {}
variable "ansible_vm_os_disk_storage_account_type" {}

variable "ansible_vm_source_image_publisher" {}
variable "ansible_vm_source_image_offer" {}
variable "ansible_vm_source_image_sku" {}
variable "ansible_vm_source_image_version" {}

variable "ansible_vm_plan_name" {}
variable "ansible_vm_plan_product" {}
variable "ansible_vm_plan_publisher" {}


variable "stdiag_primary_blob" {}

variable "utilities_rg_name" {}
variable "rsv_name" {}
variable "backup_policy_id" {}
