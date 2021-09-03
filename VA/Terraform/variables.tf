
variable "tt_support_email" {}
variable "tt_support_name" {}
variable "tt_support_phone" {}

# Main Resource Groups

variable "main_rg_name" {
  description = "The name of the resource group"
}
variable "network_rg_name" {
  description = "The name of the resource group"
}
variable "utilities_rg_name" {
  description = "The name of the resource group"
}

variable "location" {
  description = "The name of the resource group"
}

variable "location_prefix" {
  description = "The name of the resource group"
}
#  Tags

variable "environment_tag_value" {
  type        = string
  description = "Tag value for Environment"
}
variable "createdby_tag_value" {
  type        = string
  description = "Tag value for Created By"
}
#variable "createddate_tag_value" {
 # type        = string
  #description = "Tag value for Created Date"
#}
variable "tag1_key" {
  type        = string
  description = "Value for dedicated tag 1 key"
}
variable "tag2_key" {
  type        = string
  description = "Value for dedicated tag 2 key"
}
variable "tag3_key" {
  type        = string
  description = "Value for dedicated tag 3 key"
}
variable "tag1_value" {
  type        = string
  description = "Value for dedicated tag 1 value"
}
variable "tag2_value" {
  type        = string
  description = "Value for dedicated tag 2 value"
}
variable "tag3_value" {
  type        = string
  description = "Value for dedicated tag 3 value"
}


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

#Virtual Network

variable "network_name" {
  description = "Vnet name for the main region"
}

variable "network_address_space" {
  description = "CIDR for the vnet, /23 is recommended."
}

#Subnets

variable "azurefirewallsubnet_prefixes" {}

variable "gatewaysubnet_prefixes" {}

variable "bh_subnet_name" {}

variable "bh_subnet_prefixes" {}

#Bitdefender
variable "bitdefender_subnet_name" {
  description = "bitdefender Subnet Name"
}
variable "bitdefender_subnet_prefixes" {
  description = "bitdefender Subnet CIDR"
}

#jfrog
variable "jfrog_subnet_name" {
  description = "jfrog Subnet Name"
}
variable "jfrog_subnet_prefixes" {
  description = "jfrog Subnet CIDR"
}

#ghe
variable "ghe_subnet_name" {
  description = "ghe Subnet Name"
}
variable "ghe_subnet_prefixes" {
  description = "ghe Subnet CIDR"
}

#jira
variable "jira_subnet_name" {
  description = "jira Subnet Name"
}
variable "jira_subnet_prefixes" {
  description = "jira Subnet CIDR"
}

#jenkins
variable "jenkins_subnet_name" {
  description = "jenkins Subnet Name"
}
variable "jenkins_subnet_prefixes" {
  description = "jenkins Subnet CIDR"
}

#sonarqube
variable "sonarqube_subnet_name" {
  description = "sonarqube Subnet Name"
}
variable "sonarqube_subnet_prefixes" {
  description = "sonarqube Subnet CIDR"
}

#selenium
variable "selenium_subnet_name" {
  description = "selenium Subnet Name"
}
variable "selenium_subnet_prefixes" {
  description = "selenium Subnet CIDR"
}

#ansible
variable "ansible_subnet_name" {
  description = "ansible Subnet Name"
}
variable "ansible_subnet_prefixes" {
  description = "ansible Subnet CIDR"
}

#sqlserver
variable "sqlserver_subnet_name" {
  description = "sqlserver Subnet Name"
}
variable "sqlserver_subnet_prefixes" {
  description = "sqlserver Subnet CIDR"
}

#platform
variable "platform_subnet_name" {
  description = "platform Subnet Name"
}
variable "platform_subnet_prefixes" {
  description = "platform Subnet CIDR"
}

#rediscache
variable "rediscache_subnet_name" {
  description = "rediscache Subnet Name"
}
variable "rediscache_subnet_prefixes" {
  description = "rediscache Subnet CIDR"
}

#semmle
variable "semmle_subnet_name" {
  description = "semmle Subnet Name"
}
variable "semmle_subnet_prefixes" {
  description = "semmle Subnet CIDR"
}

# Storage Accounts

# variable "resource_group_name" {
#   description = "The name of the resource group"
# }

variable "stshared_name" {
  description = "The name of the storage account"
}

variable "stshared_account_tier" {
  description = "The storage account tier"
}

variable "stshared_access_tier" {
  description = "The storage account tier"
}
variable "stshared_replication_type" {
  description = "The storage replication type"
}

#ST Diag

variable "stdiag_name" {
  description = "The name of the storage account"
}

variable "stdiag_account_tier" {
  description = "The storage account tier"
}

variable "stdiag_access_tier" {
  description = "The storage account tier"
}
variable "stdiag_replication_type" {
  description = "The storage replication type"
}

#ST Net Diag

variable "stnetdiag_name" {
  description = "The name of the storage account"
}

variable "stnetdiag_account_tier" {
  description = "The storage account tier"
}

variable "stnetdiag_access_tier" {
  description = "The storage account tier"
}
variable "stnetdiag_replication_type" {
  description = "The storage replication type"
}

#ST jFrog

variable "stjfrog_name" {
  description = "The name of the storage account"
}

variable "stjfrog_account_tier" {
  description = "The storage account tier"
}

variable "stjfrog_access_tier" {
  description = "The storage account tier"
}

variable "stjfrog_replication_type" {
  description = "The storage replication type"
}


# variable "use_storage_queue" {
#   description = "Set this variable to 1, in order to create a storage queue. Set it to 0 to ignore the storage queue"
# }

# variable "use_storage_share" {
#   description = "Set this variable to 1, in order to create a storage share. Set it to 0 to ignore the storage share"
# }

# variable "storage_tables_number" {
#   description = "The number of storage tables. If you set it to 0, no storage tables will be created"
# }

variable "storage_container_name" {
  description = "The name of the storage container"
  #type        = list
}

variable "storage_container_access_type" {
  description = "The storage container access type. Can be blob, container or private"
}
variable "bitdefender_blob_source_uri" {}

# variable "storage_blob_sizes" {
#   description = "The sizes of the storages blobs. If this list is empty, no storage blobs will be created."
#   type        = list
# }

# variable "storage_blob_types" {
#   description = "The types of the storages blobs. Can be block or page."
#   type        = list
# }
# -----------------------------Redis Cache-------------#
variable "rediscache_name" {
  description = "rediscache name"
}
variable "rediscache_sku" {
  description = "rediscache sku"
}
variable "rediscache_ssl_port" {
  description = "SSL Port"
}
#variable "rediscache_subnet_id" {}
variable "rediscache_capacity" {}
variable "rediscache_family" {}

#KeyVault
variable "kv_name" {}
variable "kv_sku" {}
variable "kv_enable_disk_encryption" {}
variable "kv_enable_soft_delete" {}
variable "kv_soft_delete_retention_days" {}
variable "kv_enable_purge_protection" {}
variable "kv_certificate_permissions" {}
variable "kv_key_permissions" {}
variable "kv_secret_permissions" {}
variable "kv_storage_permissions" {}
variable "kv_network_acls_default_action" {}
variable "kv_network_acls_bypass" {}

#Automation Account

variable "aa_name" {}
variable "aa_sku" {}

# Instance names
variable "bh_instance_name" {}
variable "jfrog_instance_name" {}
variable "ghe_instance_name" {}
variable "jenkins_instance_name" {}
variable "jenkins_windows_01_instance_name" {}
variable "jenkins_linux_01_instance_name" {}
variable "jenkins_linux_02_instance_name" {}
variable "jira_instance_name" {}
variable "platform_instance_name" {}
variable "sqlserver_instance_name" {}
variable "bitdefender_instance_name" {}
variable "sonarqube_instance_name" {}
variable "sh_instance_name" {}
variable "si_instance_name" {}
variable "sc_instance_name" {}
variable "sf_instance_name" {}
variable "ansible_instance_name" {}
variable "semmle_instance_name" {}
variable "semmle_windows_01_instance_name" {}

#Admin usernames#
variable "windows_vm_admin_username" {}
variable "linux_vm_admin_username" {}
#Bastion host 
variable "bh_vm_size" {}
variable "bh_admin_password" {}
variable "bh_vm_os_disk_caching" {}
variable "bh_vm_os_disk_storage_account_type" {}
variable "bh_vm_source_image_publisher" {}
variable "bh_vm_source_image_offer" {}
variable "bh_vm_source_image_sku" {}
variable "bh_vm_source_image_version" {}

#jFrog VM
variable "jfrog_vm_size" {}
variable "jfrog_admin_password" {}
variable "jfrog_vm_os_disk_caching" {}
variable "jfrog_vm_os_disk_storage_account_type" {}
variable "jfrog_vm_source_image_publisher" {}
variable "jfrog_vm_source_image_offer" {}
variable "jfrog_vm_source_image_sku" {}
variable "jfrog_vm_source_image_version" {}

#sh VM
variable "sh_vm_size" {}
variable "sh_admin_password" {}
variable "sh_vm_os_disk_caching" {}
variable "sh_vm_os_disk_storage_account_type" {}
variable "sh_vm_source_image_publisher" {}
variable "sh_vm_source_image_offer" {}
variable "sh_vm_source_image_sku" {}
variable "sh_vm_source_image_version" {}

#Selenium Chrome Node VM
variable "sc_vm_size" {}
variable "sc_admin_password" {}
variable "sc_vm_os_disk_caching" {}
variable "sc_vm_os_disk_storage_account_type" {}
variable "sc_vm_source_image_publisher" {}
variable "sc_vm_source_image_offer" {}
variable "sc_vm_source_image_sku" {}
variable "sc_vm_source_image_version" {}

#Selenium Firefox Node VM
variable "sf_vm_size" {}
variable "sf_admin_password" {}
variable "sf_vm_os_disk_caching" {}
variable "sf_vm_os_disk_storage_account_type" {}
variable "sf_vm_source_image_publisher" {}
variable "sf_vm_source_image_offer" {}
variable "sf_vm_source_image_sku" {}
variable "sf_vm_source_image_version" {}

#Selenium IE Node VM
variable "si_vm_size" {}
variable "si_admin_password" {}
variable "si_vm_os_disk_caching" {}
variable "si_vm_os_disk_storage_account_type" {}
variable "si_vm_source_image_publisher" {}
variable "si_vm_source_image_offer" {}
variable "si_vm_source_image_sku" {}
variable "si_vm_source_image_version" {}

#Sonarqube VM
variable "sonarqube_vm_size" {}
variable "sonarqube_admin_password" {}
variable "sonarqube_vm_os_disk_caching" {}
variable "sonarqube_vm_os_disk_storage_account_type" {}

variable "sonarqube_vm_data_disk_caching" {}
variable "sonarqube_vm_data_disk_lun" {}
variable "sonarqube_vm_data_disk_size_gb" {}
variable "sonarqube_vm_data_disk_storage_account_type" {}

variable "sonarqube_vm_source_image_publisher" {}
variable "sonarqube_vm_source_image_offer" {}
variable "sonarqube_vm_source_image_sku" {}
variable "sonarqube_vm_source_image_version" {}

#Jenkins Windows Worker 01

variable "jenkins_windows_01_vm_size" {}
variable "jenkins_windows_01_admin_password" {}
variable "jenkins_windows_01_vm_os_disk_caching" {}
variable "jenkins_windows_01_vm_os_disk_storage_account_type" {}
variable "jenkins_windows_01_vm_source_image_publisher" {}
variable "jenkins_windows_01_vm_source_image_offer" {}
variable "jenkins_windows_01_vm_source_image_sku" {}
variable "jenkins_windows_01_vm_source_image_version" {}

#semmle Windows Worker 01

variable "semmle_windows_01_vm_size" {}
variable "semmle_windows_01_admin_password" {}
variable "semmle_windows_01_vm_os_disk_caching" {}
variable "semmle_windows_01_vm_os_disk_storage_account_type" {}
variable "semmle_windows_01_vm_source_image_publisher" {}
variable "semmle_windows_01_vm_source_image_offer" {}
variable "semmle_windows_01_vm_source_image_sku" {}
variable "semmle_windows_01_vm_source_image_version" {}

#MS SQL Server
variable "sqlserver_vm_size" {}
variable "sqlserver_admin_password" {}
variable "sqlserver_vm_os_disk_caching" {}
variable "sqlserver_vm_os_disk_storage_account_type" {}

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

#GHE
variable "ghe_vm_size" {}
variable "ghe_ssh_public_key_path" {}
variable "ghe_vm_os_disk_caching" {}
variable "ghe_vm_os_disk_storage_account_type" {}

variable "ghe_vm_data_disk_caching" {}
variable "ghe_vm_data_disk_size_gb" {}
variable "ghe_vm_data_disk_lun" {}
variable "ghe_vm_data_disk_storage_account_type" {}

variable "ghe_vm_source_image_publisher" {}
variable "ghe_vm_source_image_offer" {}
variable "ghe_vm_source_image_sku" {}
variable "ghe_vm_source_image_version" {}

#jira
variable "jira_vm_size" {}
variable "jira_ssh_public_key_path" {}
variable "jira_vm_os_disk_caching" {}
variable "jira_vm_os_disk_storage_account_type" {}

variable "jira_vm_source_image_publisher" {}
variable "jira_vm_source_image_offer" {}
variable "jira_vm_source_image_sku" {}
variable "jira_vm_source_image_version" {}

variable "jira_vm_plan_name" {}
variable "jira_vm_plan_product" {}
variable "jira_vm_plan_publisher" {}

#platform
variable "platform_vm_size" {}
variable "platform_ssh_public_key_path" {}
variable "platform_vm_os_disk_caching" {}
variable "platform_vm_os_disk_storage_account_type" {}

variable "platform_vm_source_image_publisher" {}
variable "platform_vm_source_image_offer" {}
variable "platform_vm_source_image_sku" {}
variable "platform_vm_source_image_version" {}

variable "platform_vm_plan_name" {}
variable "platform_vm_plan_product" {}
variable "platform_vm_plan_publisher" {}

#semmle
variable "semmle_vm_size" {}
variable "semmle_ssh_public_key_path" {}
variable "semmle_vm_os_disk_caching" {}
variable "semmle_vm_os_disk_storage_account_type" {}

variable "semmle_vm_source_image_publisher" {}
variable "semmle_vm_source_image_offer" {}
variable "semmle_vm_source_image_sku" {}
variable "semmle_vm_source_image_version" {}

variable "semmle_vm_plan_name" {}
variable "semmle_vm_plan_product" {}
variable "semmle_vm_plan_publisher" {}

#ansible
variable "ansible_vm_size" {}
variable "ansible_ssh_public_key_path" {}
variable "ansible_vm_os_disk_caching" {}
variable "ansible_vm_os_disk_storage_account_type" {}

variable "ansible_vm_source_image_publisher" {}
variable "ansible_vm_source_image_offer" {}
variable "ansible_vm_source_image_sku" {}
variable "ansible_vm_source_image_version" {}

variable "ansible_vm_plan_name" {}
variable "ansible_vm_plan_product" {}
variable "ansible_vm_plan_publisher" {}

#jenkins
variable "jenkins_vm_size" {}
variable "jenkins_ssh_public_key_path" {}
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

#jenkins_linux_01
variable "jenkins_linux_01_vm_size" {}
variable "jenkins_linux_01_ssh_public_key_path" {}
variable "jenkins_linux_01_vm_os_disk_caching" {}
variable "jenkins_linux_01_vm_os_disk_storage_account_type" {}
variable "jenkins_linux_01_vm_os_disk_size" {}

variable "jenkins_linux_01_vm_source_image_publisher" {}
variable "jenkins_linux_01_vm_source_image_offer" {}
variable "jenkins_linux_01_vm_source_image_sku" {}
variable "jenkins_linux_01_vm_source_image_version" {}

variable "jenkins_linux_01_vm_plan_name" {}
variable "jenkins_linux_01_vm_plan_product" {}
variable "jenkins_linux_01_vm_plan_publisher" {}

#jenkins_linux_02
variable "jenkins_linux_02_vm_size" {}
variable "jenkins_linux_02_ssh_public_key_path" {}
variable "jenkins_linux_02_vm_os_disk_caching" {}
variable "jenkins_linux_02_vm_os_disk_storage_account_type" {}
variable "jenkins_linux_02_vm_os_disk_size" {}

variable "jenkins_linux_02_vm_source_image_publisher" {}
variable "jenkins_linux_02_vm_source_image_offer" {}
variable "jenkins_linux_02_vm_source_image_sku" {}
variable "jenkins_linux_02_vm_source_image_version" {}

variable "jenkins_linux_02_vm_plan_name" {}
variable "jenkins_linux_02_vm_plan_product" {}
variable "jenkins_linux_02_vm_plan_publisher" {}

#Bitdefender
variable "bitdefender_vm_size" {}

#Private DNS

variable "dns_zone_name" {}
variable "bh_dns_prefix" {}
variable "ghe_dns_prefix" {}
variable "jenkins_dns_prefix" {}
variable "jenkins_windows_01_dns_prefix" {}
variable "jenkins_linux_01_dns_prefix" {}
variable "jenkins_linux_02_dns_prefix" {}
variable "jfrog_dns_prefix" {}
variable "jira_dns_prefix" {}
variable "platform_dns_prefix" {}
variable "sqlserver_dns_prefix" {}
variable "bitdefender_dns_prefix" {}
variable "sonarqube_dns_prefix" {}
variable "sh_dns_prefix" {}
variable "si_dns_prefix" {}
variable "sc_dns_prefix" {}
variable "sf_dns_prefix" {}
variable "semmle_dns_prefix" {}
variable "semmle_windows_01_dns_prefix" {}
variable "ansible_dns_prefix" {}

###Firewall
variable "firewall_name" {}

# -----------------------------Recovery Service Vault-------------#
#RSV
variable "rsv_name" {
  type        = string
  description = "recovery service vault name"
}

#RSV Policy
variable "backup_policy_name" {}
variable "backup_policy_timezone" {}
variable "backup_policy_frequency" {}
variable "backup_policy_time" {}
variable "backup_retention_daily_count" {}
variable "backup_retention_weekly_weekdays" {}
variable "backup_retention_weekly_count" {}
variable "backup_retention_monthly_weeks" {}
variable "backup_retention_monthly_weekdays" {}
variable "backup_retention_monthly_count" {}
variable "backup_retention_yearly_months" {}
variable "backup_retention_yearly_weeks" {}
variable "backup_retention_yearly_weekdays" {}
variable "backup_retention_yearly_count" {}