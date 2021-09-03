variable "location" {}
variable "network_rg_name" {}
variable "main_rg_name" {}

variable "jenkins_nic_name" {}
variable "jenkins_subnet_id" {}

variable "jenkins_vm_name" {}
variable "jenkins_vm_size" {}
variable "linux_vm_admin_username" {}
variable "jenkins_ssh_public_key_path" {}
variable "jenkins_os_disk_name" {}
variable "jenkins_vm_os_disk_caching" {}
variable "jenkins_vm_os_disk_storage_account_type" {}
variable "jenkins_vm_os_disk_size" {}

variable "jenkins_vm_source_image_publisher" {}
variable "jenkins_vm_source_image_offer" {}
variable "jenkins_vm_source_image_sku" {}
variable "jenkins_vm_source_image_version" {}

variable "jenkins_vm_plan_name" {}
variable "jenkins_vm_plan_product" {}
variable "jenkins_vm_plan_publisher" {}


variable "stdiag_primary_blob" {}

variable "utilities_rg_name" {}
variable "rsv_name" {}
variable "backup_policy_id" {}
