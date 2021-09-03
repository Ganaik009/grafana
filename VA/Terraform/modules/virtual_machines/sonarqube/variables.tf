variable "location" {}
variable "network_rg_name" {}
variable "main_rg_name" {}

variable "sonarqube_nic_name" {}
variable "sonarqube_subnet_id" {}

variable "sonarqube_vm_name" {}
variable "sonarqube_vm_size" {}
variable "windows_vm_admin_username" {}
variable "sonarqube_admin_password" {}
variable "sonarqube_os_disk_name" {}
variable "sonarqube_vm_os_disk_caching" {}
variable "sonarqube_vm_os_disk_storage_account_type" {}

variable "sonarqube_data_disk_name" {}
variable "sonarqube_vm_data_disk_caching" {}
variable "sonarqube_vm_data_disk_size_gb" {}
variable "sonarqube_vm_data_disk_lun" {}
variable "sonarqube_vm_data_disk_storage_account_type" {}

variable "sonarqube_vm_source_image_publisher" {}
variable "sonarqube_vm_source_image_offer" {}
variable "sonarqube_vm_source_image_sku" {}
variable "sonarqube_vm_source_image_version" {}

variable "stdiag_primary_blob" {}

variable "utilities_rg_name" {}
variable "rsv_name" {}
variable "backup_policy_id" {}








