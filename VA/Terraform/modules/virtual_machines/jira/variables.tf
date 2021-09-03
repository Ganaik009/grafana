variable "location" {}
variable "network_rg_name" {}
variable "main_rg_name" {}

variable "jira_nic_name" {}
variable "jira_subnet_id" {}

variable "jira_vm_name" {}
variable "jira_vm_size" {}
variable "linux_vm_admin_username" {}
variable "jira_ssh_public_key_path" {}
variable "jira_os_disk_name" {}
variable "jira_vm_os_disk_caching" {}
variable "jira_vm_os_disk_storage_account_type" {}

variable "jira_vm_source_image_publisher" {}
variable "jira_vm_source_image_offer" {}
variable "jira_vm_source_image_sku" {}
variable "jira_vm_source_image_version" {}

variable "jira_vm_plan_name" {}
variable "jira_vm_plan_product" {}
variable "jira_vm_plan_publisher" {}


variable "stdiag_primary_blob" {}

variable "utilities_rg_name" {}
variable "rsv_name" {}
variable "backup_policy_id" {}
