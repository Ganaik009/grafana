variable "location" {}
variable "network_rg_name" {}
variable "main_rg_name" {}

variable "sqlserver_nic_name" {}
variable "sqlserver_subnet_id" {}

variable "sqlserver_vm_name" {}
variable "sqlserver_vm_size" {}
variable "windows_vm_admin_username" {}
variable "sqlserver_admin_password" {}
variable "sqlserver_os_disk_name" {}
variable "sqlserver_vm_os_disk_caching" {}
variable "sqlserver_vm_os_disk_storage_account_type" {}

variable "sqlserver_data_disk01_name" {}
variable "sqlserver_vm_data_disk01_caching" {}
variable "sqlserver_vm_data_disk01_size_gb" {}
variable "sqlserver_vm_data_disk01_lun" {}
variable "sqlserver_vm_data_disk01_storage_account_type" {}

variable "sqlserver_vm_source_image_publisher" {}
variable "sqlserver_vm_source_image_offer" {}
variable "sqlserver_vm_source_image_sku" {}
variable "sqlserver_vm_source_image_version" {}

variable "sql_license_type" {}
variable "r_services_enabled" {}
variable "sql_connectivity_port" {}  
variable "sql_connectivity_type" {}  
variable "sql_connectivity_update_password" {}
variable "sql_connectivity_update_username" {}
variable "sql_maintenance_day_of_week" {}
variable "sql_maintenance_window_duration_in_minutes" {}
variable "sql_maintenance_window_starting_hour" {}

variable "stdiag_primary_blob" {}

variable "utilities_rg_name" {}
variable "rsv_name" {}
variable "backup_policy_id" {}






