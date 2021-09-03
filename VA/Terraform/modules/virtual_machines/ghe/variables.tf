variable "location" {}
variable "network_rg_name" {}
variable "main_rg_name" {}

variable "ghe_nic_name" {}
variable "ghe_subnet_id" {}

variable "ghe_vm_name" {}
variable "ghe_vm_size" {}
variable "linux_vm_admin_username" {}
variable "ghe_ssh_public_key_path" {}
variable "ghe_os_disk_name" {}
variable "ghe_vm_os_disk_caching" {}
variable "ghe_vm_os_disk_storage_account_type" {}

variable "ghe_vm_source_image_publisher" {}
variable "ghe_vm_source_image_offer" {}
variable "ghe_vm_source_image_sku" {}
variable "ghe_vm_source_image_version" {}

variable "stdiag_primary_blob" {}

variable "ghe_data_disk_name" {}
variable "ghe_vm_data_disk_caching" {}
variable "ghe_vm_data_disk_size_gb" {}
variable "ghe_vm_data_disk_lun" {}
variable "ghe_vm_data_disk_storage_account_type" {}

variable "utilities_rg_name" {}
variable "rsv_name" {}
variable "backup_policy_id" {}
