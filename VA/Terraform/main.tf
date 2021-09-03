provider "azurerm" {
    version = "~>2.4"
    environment = "usgovernment"
    features {
        key_vault {
      purge_soft_delete_on_destroy = true
        }
    }
}

resource "azurerm_security_center_auto_provisioning" "asc_auto_provisioning" {
  auto_provision = "On"
}

data "azurerm_subscription" "current" {
}

module "_name_syntax" {
  source                  = "./modules/_name_syntax"
  # Resource Group Names #
  main_rg_name                = var.main_rg_name
  network_rg_name             = var.network_rg_name
  utilities_rg_name           = var.utilities_rg_name
  location_prefix             = var.location_prefix
  # LA Name
  la_name                     = var.la_name
  # Storage Accounts Name
  stshared_name               = var.stshared_name
  stdiag_name                 = var.stdiag_name
  stnetdiag_name              = var.stnetdiag_name
  stjfrog_name                = var.stjfrog_name
  # Virtual Network
  network_name                = var.network_name
  # RSV Name
  rsv_name                    = var.rsv_name
  #KeyVault name
  kv_name                     = var.kv_name
  #Automation Account Name
  aa_name                     = var.aa_name
  #Instance names
  bh_instance_name            = var.bh_instance_name
  jfrog_instance_name         = var.jfrog_instance_name
  ghe_instance_name           = var.ghe_instance_name
  jenkins_instance_name       = var.jenkins_instance_name
  jenkins_windows_01_instance_name       = var.jenkins_windows_01_instance_name
  jenkins_linux_01_instance_name       = var.jenkins_linux_01_instance_name
  jenkins_linux_02_instance_name       = var.jenkins_linux_02_instance_name
  jira_instance_name          = var.jira_instance_name
  platform_instance_name      = var.platform_instance_name
  sqlserver_instance_name     = var.sqlserver_instance_name
  bitdefender_instance_name   = var.bitdefender_instance_name
  sh_instance_name            = var.sh_instance_name
  si_instance_name            = var.si_instance_name
  sc_instance_name            = var.sc_instance_name
  sf_instance_name            = var.sf_instance_name
  sonarqube_instance_name     = var.sonarqube_instance_name
  ansible_instance_name       = var.ansible_instance_name
  semmle_instance_name        = var.semmle_instance_name
  semmle_windows_01_instance_name       = var.semmle_windows_01_instance_name
  rediscache_name             = var.rediscache_name
}


module "_main_rg" {
  source                  = "./modules/_main_rg"
  main_rg_name                = module._name_syntax.main_rg_name
  network_rg_name             = module._name_syntax.network_rg_name
  utilities_rg_name           = module._name_syntax.utilities_rg_name
  location                    = var.location
 }
module "loganalytics" {
  source                  = "./modules/loganalytics"
  depends_on              = [module._main_rg]
  utilities_rg_name       = module._main_rg.utilities_rg_name
  location                = var.location
  la_name                 = module._name_syntax.la_name
  la_sku                  = var.la_sku
  la_retention_in_days    = var.la_retention_in_days
  }

  resource "azurerm_monitor_diagnostic_setting" "diag-activitylog" {
  depends_on         = [module.loganalytics]
  name               = "diag-activitylog"
  target_resource_id = data.azurerm_subscription.current.id
  log_analytics_workspace_id = module.loganalytics.loganalytics_id

  log {
    category = "Administrative"
    enabled  = true
  }

  log {
    category = "Security"
    enabled  = true
  }

  log {
    category = "ServiceHealth"
    enabled  = true
  }

  log {
    category = "Alert"
    enabled  = true
  }

  log {
    category = "Recommendation"
    enabled  = true
  }

  log {
    category = "Policy"
    enabled  = true
  }

  log {
    category = "Autoscale"
    enabled  = true
  }

  log {
    category = "ResourceHealth"
    enabled  = true
  }
}

# ---------Recovery Service Vault and Backup Policy for the VMs------------#

module "rsv" {
  source              = "./modules/recovery_service_vault"
  rsv_name            = module._name_syntax.rsv_name
  depends_on          = [
                        module.loganalytics,
                        azurerm_monitor_diagnostic_setting.diag-activitylog,
                        ]
  location            = var.location
  utilities_rg_name   = module._main_rg.utilities_rg_name
  backup_policy_name                = var.backup_policy_name
  backup_policy_timezone            = var.backup_policy_timezone
  backup_policy_frequency           = var.backup_policy_frequency
  backup_policy_time                = var.backup_policy_time
  backup_retention_daily_count      = var.backup_retention_daily_count
  backup_retention_weekly_weekdays  = var.backup_retention_weekly_weekdays
  backup_retention_weekly_count     = var.backup_retention_weekly_count
  backup_retention_monthly_weeks    = var.backup_retention_monthly_weeks
  backup_retention_monthly_weekdays = var.backup_retention_monthly_weekdays
  backup_retention_monthly_count    = var.backup_retention_monthly_count
  backup_retention_yearly_months    = var.backup_retention_yearly_months
  backup_retention_yearly_weeks     = var.backup_retention_yearly_weeks
  backup_retention_yearly_weekdays  = var.backup_retention_yearly_weekdays
  backup_retention_yearly_count     = var.backup_retention_yearly_count

  #bh_vm_id                          = module.bastionhost.bh_vm_id
}

# ---------Virtual Network and subnet------------#
module "virtual_network" {
  source                      = "./modules/virtual_network"
  depends_on                  = [module.rsv]
  network_name                = module._name_syntax.network_name
  network_address_space       = var.network_address_space
  network_rg_name             = module._main_rg.network_rg_name
  location                    = var.location
 }
 module "subnets" {
  source                        = "./modules/subnets"
  depends_on                    = [module.virtual_network]
  virtual_network_name          = module.virtual_network.network_name
  network_rg_name               = module._main_rg.network_rg_name
  #Firewall and Gateway Subnet
  azurefirewallsubnet_prefixes  = var.azurefirewallsubnet_prefixes
  gatewaysubnet_prefixes        = var.gatewaysubnet_prefixes
  #Bastion Host Subnet
  bh_subnet_name                = var.bh_subnet_name
  bh_subnet_prefixes            = var.bh_subnet_prefixes
  #Bitdefender Subnet
  bitdefender_subnet_name       = var.bitdefender_subnet_name
  bitdefender_subnet_prefixes   = var.bitdefender_subnet_prefixes
  #jfrog Subnet
  jfrog_subnet_name             = var.jfrog_subnet_name
  jfrog_subnet_prefixes         = var.jfrog_subnet_prefixes
  #ghe Subnet
  ghe_subnet_name               = var.ghe_subnet_name
  ghe_subnet_prefixes           = var.ghe_subnet_prefixes
  #jira Subnet
  jira_subnet_name              = var.jira_subnet_name
  jira_subnet_prefixes          = var.jira_subnet_prefixes
  #jenkins Subnet
  jenkins_subnet_name           = var.jenkins_subnet_name
  jenkins_subnet_prefixes       = var.jenkins_subnet_prefixes
  #sonarqube Subnet
  sonarqube_subnet_name         = var.sonarqube_subnet_name
  sonarqube_subnet_prefixes     = var.sonarqube_subnet_prefixes
  #selenium Subnet
  selenium_subnet_name          = var.selenium_subnet_name
  selenium_subnet_prefixes      = var.selenium_subnet_prefixes
  #ansible Subnet
  ansible_subnet_name           = var.ansible_subnet_name
  ansible_subnet_prefixes       = var.ansible_subnet_prefixes
  #sqlserver Subnet
  sqlserver_subnet_name         = var.sqlserver_subnet_name
  sqlserver_subnet_prefixes     = var.sqlserver_subnet_prefixes
  #platform Subnet
  platform_subnet_name          = var.platform_subnet_name
  platform_subnet_prefixes      = var.platform_subnet_prefixes
  #rediscache Subnet
  rediscache_subnet_name        = var.rediscache_subnet_name
  rediscache_subnet_prefixes    = var.rediscache_subnet_prefixes
  #semmle Subnet
  semmle_subnet_name            = var.semmle_subnet_name
  semmle_subnet_prefixes        = var.semmle_subnet_prefixes
}

module "nsg" {
  source                      = "./modules/nsg"
  network_rg_name             = module._name_syntax.network_rg_name
  location                    = var.location
  depends_on                  = [module.subnets]
  bh_nsg_name                 = module._name_syntax.bh_nsg_name
  jfrog_nsg_name              = module._name_syntax.jfrog_nsg_name
  ghe_nsg_name                = module._name_syntax.ghe_nsg_name
  jenkins_nsg_name            = module._name_syntax.jenkins_nsg_name
  jira_nsg_name               = module._name_syntax.jira_nsg_name
  platform_nsg_name           = module._name_syntax.platform_nsg_name
  sqlserver_nsg_name          = module._name_syntax.sqlserver_nsg_name
  bitdefender_nsg_name        = module._name_syntax.bitdefender_nsg_name
  selenium_nsg_name           = module._name_syntax.selenium_nsg_name
  sonarqube_nsg_name          = module._name_syntax.sonarqube_nsg_name
  ansible_nsg_name            = module._name_syntax.ansible_nsg_name
  semmle_nsg_name             = module._name_syntax.semmle_nsg_name
  rediscache_nsg_name         = module._name_syntax.rediscache_nsg_name
}

module "nsg_association" {
  source                        = "./modules/nsg_association"
  depends_on                    = [ module.nsg ]
  bh_subnet_id                 	= module.subnets.bh_subnet_id
  bh_nsg_id 			              = module.nsg.bh_nsg_id
  jfrog_subnet_id               = module.subnets.jfrog_subnet_id
  jfrog_nsg_id 			            = module.nsg.jfrog_nsg_id
  ghe_subnet_id                 = module.subnets.ghe_subnet_id
  ghe_nsg_id 			              = module.nsg.ghe_nsg_id
  jenkins_subnet_id             = module.subnets.jenkins_subnet_id
  jenkins_nsg_id 		            = module.nsg.jenkins_nsg_id
  jira_subnet_id                = module.subnets.jira_subnet_id
  jira_nsg_id 			            = module.nsg.jira_nsg_id
  platform_subnet_id            = module.subnets.platform_subnet_id
  platform_nsg_id     		      = module.nsg.platform_nsg_id
  sqlserver_subnet_id           = module.subnets.sqlserver_subnet_id
  sqlserver_nsg_id 		          = module.nsg.sqlserver_nsg_id
  bitdefender_subnet_id         = module.subnets.bitdefender_subnet_id
  bitdefender_nsg_id 		        = module.nsg.bitdefender_nsg_id
  sonarqube_subnet_id           = module.subnets.sonarqube_subnet_id
  sonarqube_nsg_id 		          = module.nsg.sonarqube_nsg_id
  selenium_subnet_id            = module.subnets.selenium_subnet_id
  selenium_nsg_id 		          = module.nsg.selenium_nsg_id
  ansible_subnet_id             = module.subnets.ansible_subnet_id
  ansible_nsg_id 		            = module.nsg.ansible_nsg_id
  rediscache_subnet_id          = module.subnets.rediscache_subnet_id
  rediscache_nsg_id 		        = module.nsg.rediscache_nsg_id
  semmle_subnet_id              = module.subnets.semmle_subnet_id
  semmle_nsg_id 		            = module.nsg.semmle_nsg_id
}

module "storage_accounts" {
  source                            = "./modules/storage_accounts"
  depends_on                        = [module.nsg_association]
  # Shared Storage Account#
  stshared_name                     = module._name_syntax.stshared_name
  location                          = var.location
  utilities_rg_name                 = module._main_rg.utilities_rg_name
  stshared_account_tier             = var.stshared_account_tier
  stshared_access_tier              = var.stshared_access_tier
  stshared_replication_type         = var.stshared_replication_type
  # Shared Storage Container#
  storage_container_name            = var.storage_container_name
  storage_container_access_type     = var.storage_container_access_type
  bitdefender_blob_source_uri       = var.bitdefender_blob_source_uri
  # Diagnostic Storage Account#
  stdiag_name                       = module._name_syntax.stdiag_name
  stdiag_account_tier               = var.stdiag_account_tier
  stdiag_access_tier                = var.stdiag_access_tier
  stdiag_replication_type           = var.stdiag_replication_type
  # Network Diagnostic Storage Account#
  stnetdiag_name                    = module._name_syntax.stnetdiag_name
  stnetdiag_account_tier            = var.stnetdiag_account_tier
  stnetdiag_access_tier             = var.stnetdiag_access_tier
  stnetdiag_replication_type        = var.stnetdiag_replication_type
  #jFrog Storage
  stjfrog_name                      = module._name_syntax.stjfrog_name
  stjfrog_account_tier              = var.stjfrog_account_tier
  stjfrog_access_tier               = var.stjfrog_access_tier
  stjfrog_replication_type          = var.stjfrog_replication_type
  
}

module "kv" {
  source                          = "./modules/keyvault"
  depends_on                      = [module.nsg_association]
  kv_name                         = module._name_syntax.kv_name
  kv_sku                          = var.kv_sku
  location                        = var.location
  utilities_rg_name               = module._main_rg.utilities_rg_name
  kv_enable_disk_encryption       = var.kv_enable_disk_encryption
  kv_enable_soft_delete           = var.kv_enable_soft_delete
  kv_soft_delete_retention_days   = var.kv_soft_delete_retention_days
  kv_enable_purge_protection      = var.kv_enable_purge_protection
  kv_certificate_permissions      = var.kv_certificate_permissions
  kv_key_permissions              = var.kv_key_permissions
  kv_secret_permissions           = var.kv_secret_permissions
  kv_storage_permissions          = var.kv_storage_permissions
  kv_network_acls_default_action  = var.kv_network_acls_default_action
  kv_network_acls_bypass          = var.kv_network_acls_bypass
  azurefirewallsubnet_id          = module.subnets.azurefirewallsubnet_id
  gatewaysubnet_id                = module.subnets.gatewaysubnet_id
  bh_subnet_id                    = module.subnets.bh_subnet_id
  bitdefender_subnet_id           = module.subnets.bitdefender_subnet_id
  jfrog_subnet_id                 = module.subnets.jfrog_subnet_id
  ghe_subnet_id                   = module.subnets.ghe_subnet_id
  jira_subnet_id                  = module.subnets.jira_subnet_id
  jenkins_subnet_id               = module.subnets.jenkins_subnet_id
  sonarqube_subnet_id             = module.subnets.sonarqube_subnet_id
  selenium_subnet_id              = module.subnets.selenium_subnet_id
  ansible_subnet_id               = module.subnets.ansible_subnet_id
  sqlserver_subnet_id             = module.subnets.sqlserver_subnet_id
  platform_subnet_id              = module.subnets.platform_subnet_id
  rediscache_subnet_id            = module.subnets.rediscache_subnet_id
  semmle_subnet_id                = module.subnets.semmle_subnet_id

  tt_support_email                = var.tt_support_email
  tt_support_name                 = var.tt_support_name
  tt_support_phone                = var.tt_support_phone
}

#automation Account
module "aa" {
  source                    = "./modules/automation_account"
  depends_on                = [module.kv]
  aa_name                   = module._name_syntax.aa_name
  location                  = var.location
  utilities_rg_name         = module._main_rg.utilities_rg_name
  aa_sku                    = var.aa_sku
}

# Bastion Host
module "bastionhost" {
  source                            = "./modules/virtual_machines/bastionhost"
  depends_on                        = [module.aa]
  bh_nic_name                       = module._name_syntax.bh_nic_name
  location                          = var.location
  network_rg_name                   = module._main_rg.network_rg_name
  bh_subnet_id                      = module.subnets.bh_subnet_id
  bh_vm_name                        = module._name_syntax.bh_vm_name
  main_rg_name                      = module._main_rg.main_rg_name
  bh_vm_size                        = var.bh_vm_size
  windows_vm_admin_username         = var.windows_vm_admin_username
  bh_admin_password                 = var.bh_admin_password
  bh_os_disk_name                   = module._name_syntax.bh_os_disk_name
  bh_vm_os_disk_caching             = var.bh_vm_os_disk_caching
  bh_vm_os_disk_storage_account_type = var.bh_vm_os_disk_storage_account_type
  bh_vm_source_image_publisher      = var.bh_vm_source_image_publisher
  bh_vm_source_image_offer          = var.bh_vm_source_image_offer
  bh_vm_source_image_sku            = var.bh_vm_source_image_sku
  bh_vm_source_image_version        = var.bh_vm_source_image_version
  stdiag_primary_blob               = module.storage_accounts.stdiag_primary_blob 
  utilities_rg_name                 = module._main_rg.utilities_rg_name
  rsv_name                          = module.rsv.rsv_name
  backup_policy_id                  = module.rsv.backup_policy_id
}

module "jfrog" {
  source                            = "./modules/virtual_machines/jfrog"
  depends_on                        = [module.bastionhost]
  jfrog_nic_name                    = module._name_syntax.jfrog_nic_name
  location                          = var.location
  network_rg_name                   = module._main_rg.network_rg_name
  jfrog_subnet_id                   = module.subnets.jfrog_subnet_id
  jfrog_vm_name                     = module._name_syntax.jfrog_vm_name
  main_rg_name                      = module._main_rg.main_rg_name
  jfrog_vm_size                     = var.jfrog_vm_size
  windows_vm_admin_username         = var.windows_vm_admin_username
  jfrog_admin_password              = var.jfrog_admin_password
  jfrog_os_disk_name                = module._name_syntax.jfrog_os_disk_name
  jfrog_vm_os_disk_caching          = var.jfrog_vm_os_disk_caching
  jfrog_vm_os_disk_storage_account_type = var.jfrog_vm_os_disk_storage_account_type
  jfrog_vm_source_image_publisher   = var.jfrog_vm_source_image_publisher
  jfrog_vm_source_image_offer       = var.jfrog_vm_source_image_offer
  jfrog_vm_source_image_sku         = var.jfrog_vm_source_image_sku
  jfrog_vm_source_image_version     = var.jfrog_vm_source_image_version
  stdiag_primary_blob               = module.storage_accounts.stdiag_primary_blob 
  utilities_rg_name                 = module._main_rg.utilities_rg_name
  rsv_name                          = module.rsv.rsv_name
  backup_policy_id                  = module.rsv.backup_policy_id
}

module "selenium_hub" {
  source                            = "./modules/virtual_machines/selenium_hub"
  depends_on                        = [module.jfrog]
  sh_nic_name                       = module._name_syntax.sh_nic_name
  location                          = var.location
  network_rg_name                   = module._main_rg.network_rg_name
  selenium_subnet_id                = module.subnets.selenium_subnet_id
  sh_vm_name                        = module._name_syntax.sh_vm_name
  main_rg_name                      = module._main_rg.main_rg_name
  sh_vm_size                        = var.sh_vm_size
  windows_vm_admin_username         = var.windows_vm_admin_username
  sh_admin_password                 = var.sh_admin_password
  sh_os_disk_name                   = module._name_syntax.sh_os_disk_name
  sh_vm_os_disk_caching             = var.sh_vm_os_disk_caching
  sh_vm_os_disk_storage_account_type = var.sh_vm_os_disk_storage_account_type
  sh_vm_source_image_publisher      = var.sh_vm_source_image_publisher
  sh_vm_source_image_offer          = var.sh_vm_source_image_offer
  sh_vm_source_image_sku            = var.sh_vm_source_image_sku
  sh_vm_source_image_version        = var.sh_vm_source_image_version
  stdiag_primary_blob               = module.storage_accounts.stdiag_primary_blob
  utilities_rg_name                 = module._main_rg.utilities_rg_name
  rsv_name                          = module.rsv.rsv_name
  backup_policy_id                  = module.rsv.backup_policy_id 
}

module "selenium_chrome" {
  source                            = "./modules/virtual_machines/selenium_chrome"
  depends_on                        = [module.selenium_hub]
  sc_nic_name                       = module._name_syntax.sc_nic_name
  location                          = var.location
  network_rg_name                   = module._main_rg.network_rg_name
  selenium_subnet_id                = module.subnets.selenium_subnet_id
  sc_vm_name                        = module._name_syntax.sc_vm_name
  main_rg_name                      = module._main_rg.main_rg_name
  sc_vm_size                        = var.sc_vm_size
  windows_vm_admin_username         = var.windows_vm_admin_username
  sc_admin_password                 = var.sc_admin_password
  sc_os_disk_name                   = module._name_syntax.sc_os_disk_name
  sc_vm_os_disk_caching             = var.sc_vm_os_disk_caching
  sc_vm_os_disk_storage_account_type = var.sc_vm_os_disk_storage_account_type
  sc_vm_source_image_publisher      = var.sc_vm_source_image_publisher
  sc_vm_source_image_offer          = var.sc_vm_source_image_offer
  sc_vm_source_image_sku            = var.sc_vm_source_image_sku
  sc_vm_source_image_version        = var.sc_vm_source_image_version
  stdiag_primary_blob               = module.storage_accounts.stdiag_primary_blob 
  utilities_rg_name                 = module._main_rg.utilities_rg_name
  rsv_name                          = module.rsv.rsv_name
  backup_policy_id                  = module.rsv.backup_policy_id
}

module "selenium_firefox" {
  source                            = "./modules/virtual_machines/selenium_firefox"
  depends_on                        = [module.selenium_chrome]
  sf_nic_name                       = module._name_syntax.sf_nic_name
  location                          = var.location
  network_rg_name                   = module._main_rg.network_rg_name
  selenium_subnet_id                = module.subnets.selenium_subnet_id
  sf_vm_name                        = module._name_syntax.sf_vm_name
  main_rg_name                      = module._main_rg.main_rg_name
  sf_vm_size                        = var.sf_vm_size
  windows_vm_admin_username         = var.windows_vm_admin_username
  sf_admin_password                 = var.sf_admin_password
  sf_os_disk_name                   = module._name_syntax.sf_os_disk_name
  sf_vm_os_disk_caching             = var.sf_vm_os_disk_caching
  sf_vm_os_disk_storage_account_type = var.sf_vm_os_disk_storage_account_type
  sf_vm_source_image_publisher      = var.sf_vm_source_image_publisher
  sf_vm_source_image_offer          = var.sf_vm_source_image_offer
  sf_vm_source_image_sku            = var.sf_vm_source_image_sku
  sf_vm_source_image_version        = var.sf_vm_source_image_version
  stdiag_primary_blob               = module.storage_accounts.stdiag_primary_blob 
  utilities_rg_name                 = module._main_rg.utilities_rg_name
  rsv_name                          = module.rsv.rsv_name
  backup_policy_id                  = module.rsv.backup_policy_id
}

module "selenium_ie" {
  source                            = "./modules/virtual_machines/selenium_ie"
  depends_on                        = [module.selenium_firefox]
  si_nic_name                       = module._name_syntax.si_nic_name
  location                          = var.location
  network_rg_name                   = module._main_rg.network_rg_name
  selenium_subnet_id                = module.subnets.selenium_subnet_id
  si_vm_name                        = module._name_syntax.si_vm_name
  main_rg_name                      = module._main_rg.main_rg_name
  si_vm_size                        = var.si_vm_size
  windows_vm_admin_username         = var.windows_vm_admin_username
  si_admin_password                 = var.si_admin_password
  si_os_disk_name                   = module._name_syntax.si_os_disk_name
  si_vm_os_disk_caching             = var.si_vm_os_disk_caching
  si_vm_os_disk_storage_account_type = var.si_vm_os_disk_storage_account_type
  si_vm_source_image_publisher      = var.si_vm_source_image_publisher
  si_vm_source_image_offer          = var.si_vm_source_image_offer
  si_vm_source_image_sku            = var.si_vm_source_image_sku
  si_vm_source_image_version        = var.si_vm_source_image_version
  stdiag_primary_blob               = module.storage_accounts.stdiag_primary_blob 
  utilities_rg_name                 = module._main_rg.utilities_rg_name
  rsv_name                          = module.rsv.rsv_name
  backup_policy_id                  = module.rsv.backup_policy_id
}

module "sonarqube" {
  source                                   = "./modules/virtual_machines/sonarqube"
  depends_on                               = [module.selenium_ie]
  sonarqube_nic_name                       = module._name_syntax.sonarqube_nic_name
  location                                 = var.location
  network_rg_name                          = module._main_rg.network_rg_name
  sonarqube_subnet_id                      = module.subnets.sonarqube_subnet_id
  sonarqube_vm_name                        = module._name_syntax.sonarqube_vm_name
  main_rg_name                             = module._main_rg.main_rg_name
  sonarqube_vm_size                        = var.sonarqube_vm_size
  windows_vm_admin_username                = var.windows_vm_admin_username
  sonarqube_admin_password                 = var.sonarqube_admin_password
  sonarqube_os_disk_name                   = module._name_syntax.sonarqube_os_disk_name
  sonarqube_vm_os_disk_caching             = var.sonarqube_vm_os_disk_caching
  sonarqube_vm_os_disk_storage_account_type = var.sonarqube_vm_os_disk_storage_account_type
  sonarqube_data_disk_name                  = module._name_syntax.sonarqube_data_disk_name
  sonarqube_vm_data_disk_caching            = var.sonarqube_vm_data_disk_caching
  sonarqube_vm_data_disk_size_gb            = var.sonarqube_vm_data_disk_size_gb
  sonarqube_vm_data_disk_lun                = var.sonarqube_vm_data_disk_lun
  sonarqube_vm_data_disk_storage_account_type = var.sonarqube_vm_data_disk_storage_account_type
  sonarqube_vm_source_image_publisher       = var.sonarqube_vm_source_image_publisher
  sonarqube_vm_source_image_offer           = var.sonarqube_vm_source_image_offer
  sonarqube_vm_source_image_sku             = var.sonarqube_vm_source_image_sku
  sonarqube_vm_source_image_version         = var.sonarqube_vm_source_image_version
  stdiag_primary_blob                       = module.storage_accounts.stdiag_primary_blob 
  utilities_rg_name                         = module._main_rg.utilities_rg_name
  rsv_name                                  = module.rsv.rsv_name
  backup_policy_id                          = module.rsv.backup_policy_id
}

module "jenkins_windows_01" {
  source                                    = "./modules/virtual_machines/jenkins_windows_01"
  depends_on                                = [module.sonarqube]
  jenkins_windows_01_nic_name               = module._name_syntax.jenkins_windows_01_nic_name
  location                                  = var.location
  network_rg_name                           = module._main_rg.network_rg_name
  jenkins_subnet_id                         = module.subnets.jenkins_subnet_id
  jenkins_windows_01_vm_name                = module._name_syntax.jenkins_windows_01_vm_name
  main_rg_name                              = module._main_rg.main_rg_name
  jenkins_windows_01_vm_size                = var.jenkins_windows_01_vm_size
  windows_vm_admin_username                 = var.windows_vm_admin_username
  jenkins_windows_01_admin_password         = var.jenkins_windows_01_admin_password
  jenkins_windows_01_os_disk_name           = module._name_syntax.jenkins_windows_01_os_disk_name
  jenkins_windows_01_vm_os_disk_caching     = var.jenkins_windows_01_vm_os_disk_caching
  jenkins_windows_01_vm_os_disk_storage_account_type = var.jenkins_windows_01_vm_os_disk_storage_account_type
  jenkins_windows_01_vm_source_image_publisher      = var.jenkins_windows_01_vm_source_image_publisher
  jenkins_windows_01_vm_source_image_offer          = var.jenkins_windows_01_vm_source_image_offer
  jenkins_windows_01_vm_source_image_sku            = var.jenkins_windows_01_vm_source_image_sku
  jenkins_windows_01_vm_source_image_version        = var.jenkins_windows_01_vm_source_image_version
  stdiag_primary_blob                       = module.storage_accounts.stdiag_primary_blob 
  utilities_rg_name                         = module._main_rg.utilities_rg_name
  rsv_name                                  = module.rsv.rsv_name
  backup_policy_id                          = module.rsv.backup_policy_id
}

module "semmle_windows_01" {
  source                                    = "./modules/virtual_machines/semmle_windows_01"
  depends_on                                = [module.jenkins_windows_01]
  semmle_windows_01_nic_name                = module._name_syntax.semmle_windows_01_nic_name
  location                                  = var.location
  network_rg_name                           = module._main_rg.network_rg_name
  semmle_subnet_id                          = module.subnets.semmle_subnet_id
  semmle_windows_01_vm_name                 = module._name_syntax.semmle_windows_01_vm_name
  main_rg_name                              = module._main_rg.main_rg_name
  semmle_windows_01_vm_size                 = var.semmle_windows_01_vm_size
  windows_vm_admin_username                 = var.windows_vm_admin_username
  semmle_windows_01_admin_password                 = var.semmle_windows_01_admin_password
  semmle_windows_01_os_disk_name                   = module._name_syntax.semmle_windows_01_os_disk_name
  semmle_windows_01_vm_os_disk_caching             = var.semmle_windows_01_vm_os_disk_caching
  semmle_windows_01_vm_os_disk_storage_account_type = var.semmle_windows_01_vm_os_disk_storage_account_type
  semmle_windows_01_vm_source_image_publisher      = var.semmle_windows_01_vm_source_image_publisher
  semmle_windows_01_vm_source_image_offer          = var.semmle_windows_01_vm_source_image_offer
  semmle_windows_01_vm_source_image_sku            = var.semmle_windows_01_vm_source_image_sku
  semmle_windows_01_vm_source_image_version        = var.semmle_windows_01_vm_source_image_version
  stdiag_primary_blob               = module.storage_accounts.stdiag_primary_blob 
  utilities_rg_name                 = module._main_rg.utilities_rg_name
  rsv_name                          = module.rsv.rsv_name
  backup_policy_id                  = module.rsv.backup_policy_id
}

module "mssqlserver" {
  source                                   = "./modules/virtual_machines/mssqlserver"
  depends_on                               = [module.semmle_windows_01]
  sqlserver_nic_name                       = module._name_syntax.sqlserver_nic_name
  location                                 = var.location
  network_rg_name                          = module._main_rg.network_rg_name
  sqlserver_subnet_id                      = module.subnets.sqlserver_subnet_id
  sqlserver_vm_name                        = module._name_syntax.sqlserver_vm_name
  main_rg_name                             = module._main_rg.main_rg_name
  sqlserver_vm_size                        = var.sqlserver_vm_size
  windows_vm_admin_username                = var.windows_vm_admin_username
  sqlserver_admin_password                 = var.sqlserver_admin_password
  sqlserver_os_disk_name                   = module._name_syntax.sqlserver_os_disk_name
  sqlserver_vm_os_disk_caching             = var.sqlserver_vm_os_disk_caching
  sqlserver_vm_os_disk_storage_account_type = var.sqlserver_vm_os_disk_storage_account_type
  sqlserver_data_disk01_name                  = module._name_syntax.sqlserver_data_disk01_name
  sqlserver_vm_data_disk01_caching            = var.sqlserver_vm_data_disk01_caching
  sqlserver_vm_data_disk01_size_gb            = var.sqlserver_vm_data_disk01_size_gb
  sqlserver_vm_data_disk01_lun                = var.sqlserver_vm_data_disk01_lun
  sqlserver_vm_data_disk01_storage_account_type = var.sqlserver_vm_data_disk01_storage_account_type
  sqlserver_vm_source_image_publisher       = var.sqlserver_vm_source_image_publisher
  sqlserver_vm_source_image_offer           = var.sqlserver_vm_source_image_offer
  sqlserver_vm_source_image_sku             = var.sqlserver_vm_source_image_sku
  sqlserver_vm_source_image_version         = var.sqlserver_vm_source_image_version
  sql_license_type                          = var.sql_license_type
  r_services_enabled                        = var.r_services_enabled 
  sql_connectivity_port                     = var.sql_connectivity_port  
  sql_connectivity_type                     = var.sql_connectivity_type  
  sql_connectivity_update_password          = var.sql_connectivity_update_password
  sql_connectivity_update_username           = var.sql_connectivity_update_username
  sql_maintenance_day_of_week                = var.sql_maintenance_day_of_week
  sql_maintenance_window_duration_in_minutes = var.sql_maintenance_window_duration_in_minutes
  sql_maintenance_window_starting_hour       = var.sql_maintenance_window_starting_hour
   
  stdiag_primary_blob               = module.storage_accounts.stdiag_primary_blob 
  utilities_rg_name                 = module._main_rg.utilities_rg_name
  rsv_name                          = module.rsv.rsv_name
  backup_policy_id                  = module.rsv.backup_policy_id
}

module "ghe" {
  source                              = "./modules/virtual_machines/ghe"
  depends_on                          = [module.mssqlserver]
  ghe_nic_name                        = module._name_syntax.ghe_nic_name
  location                            = var.location
  network_rg_name                     = module._main_rg.network_rg_name
  ghe_subnet_id                       = module.subnets.ghe_subnet_id
  ghe_vm_name                         = module._name_syntax.ghe_vm_name
  main_rg_name                        = module._main_rg.main_rg_name
  ghe_vm_size                         = var.ghe_vm_size
  linux_vm_admin_username             = var.linux_vm_admin_username
  ghe_ssh_public_key_path             = var.ghe_ssh_public_key_path
  ghe_os_disk_name                    = module._name_syntax.ghe_os_disk_name
  ghe_vm_os_disk_caching              = var.ghe_vm_os_disk_caching
  ghe_vm_os_disk_storage_account_type = var.ghe_vm_os_disk_storage_account_type
  ghe_data_disk_name                  = module._name_syntax.ghe_data_disk_name
  ghe_vm_data_disk_caching            = var.ghe_vm_data_disk_caching
  ghe_vm_data_disk_size_gb            = var.ghe_vm_data_disk_size_gb
  ghe_vm_data_disk_lun                = var.ghe_vm_data_disk_lun
  ghe_vm_data_disk_storage_account_type = var.ghe_vm_data_disk_storage_account_type
  ghe_vm_source_image_publisher       = var.ghe_vm_source_image_publisher
  ghe_vm_source_image_offer           = var.ghe_vm_source_image_offer
  ghe_vm_source_image_sku             = var.ghe_vm_source_image_sku
  ghe_vm_source_image_version         = var.ghe_vm_source_image_version
  stdiag_primary_blob                 = module.storage_accounts.stdiag_primary_blob 
  utilities_rg_name                   = module._main_rg.utilities_rg_name
  rsv_name                            = module.rsv.rsv_name
  backup_policy_id                    = module.rsv.backup_policy_id
}

module "jira" {
  source                               = "./modules/virtual_machines/jira"
  depends_on                           = [module.ghe]
  jira_nic_name                        = module._name_syntax.jira_nic_name
  location                             = var.location
  network_rg_name                      = module._main_rg.network_rg_name
  jira_subnet_id                       = module.subnets.jira_subnet_id
  jira_vm_name                         = module._name_syntax.jira_vm_name
  main_rg_name                         = module._main_rg.main_rg_name
  jira_vm_size                         = var.jira_vm_size
  linux_vm_admin_username              = var.linux_vm_admin_username
  jira_ssh_public_key_path             = var.jira_ssh_public_key_path
  jira_os_disk_name                    = module._name_syntax.jira_os_disk_name
  jira_vm_os_disk_caching              = var.jira_vm_os_disk_caching
  jira_vm_os_disk_storage_account_type = var.jira_vm_os_disk_storage_account_type
  jira_vm_source_image_publisher       = var.jira_vm_source_image_publisher
  jira_vm_source_image_offer           = var.jira_vm_source_image_offer
  jira_vm_source_image_sku             = var.jira_vm_source_image_sku
  jira_vm_source_image_version         = var.jira_vm_source_image_version

  jira_vm_plan_name                    = var.jira_vm_plan_name
  jira_vm_plan_product                 = var.jira_vm_plan_product
  jira_vm_plan_publisher               = var.jira_vm_plan_publisher 

  stdiag_primary_blob                  = module.storage_accounts.stdiag_primary_blob 
  utilities_rg_name                    = module._main_rg.utilities_rg_name
  rsv_name                             = module.rsv.rsv_name
  backup_policy_id                     = module.rsv.backup_policy_id
}

module "platform" {
  source                                   = "./modules/virtual_machines/platform"
  depends_on                               = [module.jira]
  platform_nic_name                        = module._name_syntax.platform_nic_name
  location                                 = var.location
  network_rg_name                          = module._main_rg.network_rg_name
  platform_subnet_id                       = module.subnets.platform_subnet_id
  platform_vm_name                         = module._name_syntax.platform_vm_name
  main_rg_name                             = module._main_rg.main_rg_name
  platform_vm_size                         = var.platform_vm_size
  linux_vm_admin_username                  = var.linux_vm_admin_username
  platform_ssh_public_key_path             = var.platform_ssh_public_key_path
  platform_os_disk_name                    = module._name_syntax.platform_os_disk_name
  platform_vm_os_disk_caching              = var.platform_vm_os_disk_caching
  platform_vm_os_disk_storage_account_type = var.platform_vm_os_disk_storage_account_type
  platform_vm_source_image_publisher       = var.platform_vm_source_image_publisher
  platform_vm_source_image_offer           = var.platform_vm_source_image_offer
  platform_vm_source_image_sku             = var.platform_vm_source_image_sku
  platform_vm_source_image_version         = var.platform_vm_source_image_version

  platform_vm_plan_name                    = var.platform_vm_plan_name
  platform_vm_plan_product                 = var.platform_vm_plan_product
  platform_vm_plan_publisher               = var.platform_vm_plan_publisher 

  stdiag_primary_blob                  = module.storage_accounts.stdiag_primary_blob 
  utilities_rg_name                    = module._main_rg.utilities_rg_name
  rsv_name                             = module.rsv.rsv_name
  backup_policy_id                     = module.rsv.backup_policy_id
}

module "semmle" {
  source                                 = "./modules/virtual_machines/semmle"
  depends_on                             = [module.platform]
  semmle_nic_name                        = module._name_syntax.semmle_nic_name
  location                               = var.location
  network_rg_name                        = module._main_rg.network_rg_name
  semmle_subnet_id                       = module.subnets.semmle_subnet_id
  semmle_vm_name                         = module._name_syntax.semmle_vm_name
  main_rg_name                           = module._main_rg.main_rg_name
  semmle_vm_size                         = var.semmle_vm_size
  linux_vm_admin_username                = var.linux_vm_admin_username
  semmle_ssh_public_key_path             = var.semmle_ssh_public_key_path
  semmle_os_disk_name                    = module._name_syntax.semmle_os_disk_name
  semmle_vm_os_disk_caching              = var.semmle_vm_os_disk_caching
  semmle_vm_os_disk_storage_account_type = var.semmle_vm_os_disk_storage_account_type
  semmle_vm_source_image_publisher       = var.semmle_vm_source_image_publisher
  semmle_vm_source_image_offer           = var.semmle_vm_source_image_offer
  semmle_vm_source_image_sku             = var.semmle_vm_source_image_sku
  semmle_vm_source_image_version         = var.semmle_vm_source_image_version

  semmle_vm_plan_name                    = var.semmle_vm_plan_name
  semmle_vm_plan_product                 = var.semmle_vm_plan_product
  semmle_vm_plan_publisher               = var.semmle_vm_plan_publisher 

  stdiag_primary_blob                  = module.storage_accounts.stdiag_primary_blob 
  utilities_rg_name                    = module._main_rg.utilities_rg_name
  rsv_name                             = module.rsv.rsv_name
  backup_policy_id                     = module.rsv.backup_policy_id
}

module "ansible" {
  source                                = "./modules/virtual_machines/ansible"
  depends_on                            = [module.semmle]
  ansible_nic_name                      = module._name_syntax.ansible_nic_name
  location                              = var.location
  network_rg_name                       = module._main_rg.network_rg_name
  ansible_subnet_id                     = module.subnets.ansible_subnet_id
  ansible_vm_name                       = module._name_syntax.ansible_vm_name
  main_rg_name                          = module._main_rg.main_rg_name
  ansible_vm_size                       = var.ansible_vm_size
  linux_vm_admin_username                 = var.linux_vm_admin_username
  ansible_ssh_public_key_path             = var.ansible_ssh_public_key_path
  ansible_os_disk_name                    = module._name_syntax.ansible_os_disk_name
  ansible_vm_os_disk_caching              = var.ansible_vm_os_disk_caching
  ansible_vm_os_disk_storage_account_type = var.ansible_vm_os_disk_storage_account_type
  ansible_vm_source_image_publisher       = var.ansible_vm_source_image_publisher
  ansible_vm_source_image_offer           = var.ansible_vm_source_image_offer
  ansible_vm_source_image_sku             = var.ansible_vm_source_image_sku
  ansible_vm_source_image_version         = var.ansible_vm_source_image_version

  ansible_vm_plan_name                    = var.ansible_vm_plan_name
  ansible_vm_plan_product                 = var.ansible_vm_plan_product
  ansible_vm_plan_publisher               = var.ansible_vm_plan_publisher 

  stdiag_primary_blob                  = module.storage_accounts.stdiag_primary_blob 
  utilities_rg_name                    = module._main_rg.utilities_rg_name
  rsv_name                             = module.rsv.rsv_name
  backup_policy_id                     = module.rsv.backup_policy_id
}

module "jenkins" {
  source                                = "./modules/virtual_machines/jenkins"
  depends_on                            = [module.ansible]
  jenkins_nic_name                      = module._name_syntax.jenkins_nic_name
  location                              = var.location
  network_rg_name                       = module._main_rg.network_rg_name
  jenkins_subnet_id                     = module.subnets.jenkins_subnet_id
  jenkins_vm_name                       = module._name_syntax.jenkins_vm_name
  main_rg_name                          = module._main_rg.main_rg_name
  jenkins_vm_size                       = var.jenkins_vm_size
  linux_vm_admin_username               = var.linux_vm_admin_username
  jenkins_ssh_public_key_path           = var.jenkins_ssh_public_key_path
  jenkins_os_disk_name                  = module._name_syntax.jenkins_os_disk_name
  jenkins_vm_os_disk_caching            = var.jenkins_vm_os_disk_caching
  jenkins_vm_os_disk_size               = var.jenkins_vm_os_disk_size
  jenkins_vm_os_disk_storage_account_type = var.jenkins_vm_os_disk_storage_account_type
  jenkins_vm_source_image_publisher       = var.jenkins_vm_source_image_publisher
  jenkins_vm_source_image_offer           = var.jenkins_vm_source_image_offer
  jenkins_vm_source_image_sku             = var.jenkins_vm_source_image_sku
  jenkins_vm_source_image_version         = var.jenkins_vm_source_image_version

  jenkins_vm_plan_name                    = var.jenkins_vm_plan_name
  jenkins_vm_plan_product                 = var.jenkins_vm_plan_product
  jenkins_vm_plan_publisher               = var.jenkins_vm_plan_publisher 

  stdiag_primary_blob                  = module.storage_accounts.stdiag_primary_blob 
  utilities_rg_name                    = module._main_rg.utilities_rg_name
  rsv_name                             = module.rsv.rsv_name
  backup_policy_id                     = module.rsv.backup_policy_id
}

module "jenkins_linux_01" {
  source                              = "./modules/virtual_machines/jenkins_linux_01"
  depends_on                          = [module.jenkins]
  jenkins_linux_01_nic_name           = module._name_syntax.jenkins_linux_01_nic_name
  location                            = var.location
  network_rg_name                     = module._main_rg.network_rg_name
  jenkins_subnet_id                   = module.subnets.jenkins_subnet_id
  jenkins_linux_01_vm_name            = module._name_syntax.jenkins_linux_01_vm_name
  main_rg_name                        = module._main_rg.main_rg_name
  jenkins_linux_01_vm_size            = var.jenkins_linux_01_vm_size
  linux_vm_admin_username             = var.linux_vm_admin_username
  jenkins_linux_01_ssh_public_key_path = var.jenkins_linux_01_ssh_public_key_path
  jenkins_linux_01_os_disk_name        = module._name_syntax.jenkins_linux_01_os_disk_name
  jenkins_linux_01_vm_os_disk_caching  = var.jenkins_linux_01_vm_os_disk_caching
  jenkins_linux_01_vm_os_disk_size     = var.jenkins_linux_01_vm_os_disk_size
  jenkins_linux_01_vm_os_disk_storage_account_type = var.jenkins_linux_01_vm_os_disk_storage_account_type
  jenkins_linux_01_vm_source_image_publisher       = var.jenkins_linux_01_vm_source_image_publisher
  jenkins_linux_01_vm_source_image_offer           = var.jenkins_linux_01_vm_source_image_offer
  jenkins_linux_01_vm_source_image_sku             = var.jenkins_linux_01_vm_source_image_sku
  jenkins_linux_01_vm_source_image_version         = var.jenkins_linux_01_vm_source_image_version

  jenkins_linux_01_vm_plan_name                    = var.jenkins_linux_01_vm_plan_name
  jenkins_linux_01_vm_plan_product                 = var.jenkins_linux_01_vm_plan_product
  jenkins_linux_01_vm_plan_publisher               = var.jenkins_linux_01_vm_plan_publisher 

  stdiag_primary_blob                  = module.storage_accounts.stdiag_primary_blob 
  utilities_rg_name                    = module._main_rg.utilities_rg_name
  rsv_name                             = module.rsv.rsv_name
  backup_policy_id                     = module.rsv.backup_policy_id
}

module "jenkins_linux_02" {
  source                                = "./modules/virtual_machines/jenkins_linux_02"
  depends_on                            = [module.jenkins_linux_01]
  jenkins_linux_02_nic_name             = module._name_syntax.jenkins_linux_02_nic_name
  location                              = var.location
  network_rg_name                       = module._main_rg.network_rg_name
  jenkins_subnet_id                     = module.subnets.jenkins_subnet_id
  jenkins_linux_02_vm_name              = module._name_syntax.jenkins_linux_02_vm_name
  main_rg_name                          = module._main_rg.main_rg_name
  jenkins_linux_02_vm_size              = var.jenkins_linux_02_vm_size
  linux_vm_admin_username               = var.linux_vm_admin_username
  jenkins_linux_02_ssh_public_key_path  = var.jenkins_linux_02_ssh_public_key_path
  jenkins_linux_02_os_disk_name         = module._name_syntax.jenkins_linux_02_os_disk_name
  jenkins_linux_02_vm_os_disk_caching   = var.jenkins_linux_02_vm_os_disk_caching
  jenkins_linux_02_vm_os_disk_size      = var.jenkins_linux_02_vm_os_disk_size
  jenkins_linux_02_vm_os_disk_storage_account_type = var.jenkins_linux_02_vm_os_disk_storage_account_type
  jenkins_linux_02_vm_source_image_publisher       = var.jenkins_linux_02_vm_source_image_publisher
  jenkins_linux_02_vm_source_image_offer           = var.jenkins_linux_02_vm_source_image_offer
  jenkins_linux_02_vm_source_image_sku             = var.jenkins_linux_02_vm_source_image_sku
  jenkins_linux_02_vm_source_image_version         = var.jenkins_linux_02_vm_source_image_version

  jenkins_linux_02_vm_plan_name                    = var.jenkins_linux_02_vm_plan_name
  jenkins_linux_02_vm_plan_product                 = var.jenkins_linux_02_vm_plan_product
  jenkins_linux_02_vm_plan_publisher               = var.jenkins_linux_02_vm_plan_publisher 

  stdiag_primary_blob                  = module.storage_accounts.stdiag_primary_blob 
  utilities_rg_name                    = module._main_rg.utilities_rg_name
  rsv_name                             = module.rsv.rsv_name
  backup_policy_id                     = module.rsv.backup_policy_id
}

module "bitdefender" {
  source                                = "./modules/virtual_machines/bitdefender"
  depends_on                            = [module.jenkins_linux_02]
  bitdefender_nic_name                  = module._name_syntax.bitdefender_nic_name
  location                              = var.location
  network_rg_name                       = module._main_rg.network_rg_name
  bitdefender_subnet_id                     = module.subnets.bitdefender_subnet_id
  bitdefender_vm_name                   = module._name_syntax.bitdefender_vm_name
  main_rg_name                          = module._main_rg.main_rg_name
  bitdefender_vm_size                   = var.bitdefender_vm_size
  # linux_vm_admin_username               = var.linux_vm_admin_username
  # bitdefender_ssh_public_key_path       = var.bitdefender_ssh_public_key_path
  bitdefender_os_disk_name              = module._name_syntax.bitdefender_os_disk_name
  bitdefender_blob_vhd_uri		          = module.storage_accounts.bitdefender_blob_vhd_uri

  stdiag_primary_blob                  = module.storage_accounts.stdiag_primary_blob 
  utilities_rg_name                    = module._main_rg.utilities_rg_name
  rsv_name                             = module.rsv.rsv_name
  backup_policy_id                     = module.rsv.backup_policy_id
}

module "private_dns" {
  source              = "./modules/private_dns"
  depends_on          = [module.jenkins_linux_02]
  dns_zone_name       = var.dns_zone_name
  network_rg_name     = module._main_rg.network_rg_name
  location            = var.location
  virtual_network_id  = module.virtual_network.network_id

  bh_dns_prefix       = var.bh_dns_prefix
  bh_nic_private_ip   = module.bastionhost.bh_nic_private_ip

  jfrog_dns_prefix       = var.jfrog_dns_prefix
  jfrog_nic_private_ip   = module.jfrog.jfrog_nic_private_ip

  ghe_dns_prefix       = var.ghe_dns_prefix
  ghe_nic_private_ip   = module.ghe.ghe_nic_private_ip

  jenkins_dns_prefix       = var.jenkins_dns_prefix
  jenkins_nic_private_ip   = module.jenkins.jenkins_nic_private_ip

  jenkins_windows_01_dns_prefix       = var.jenkins_windows_01_dns_prefix
  jenkins_windows_01_nic_private_ip   = module.jenkins_windows_01.jenkins_windows_01_nic_private_ip

  jenkins_linux_01_dns_prefix       = var.jenkins_linux_01_dns_prefix
  jenkins_linux_01_nic_private_ip   = module.jenkins_linux_01.jenkins_linux_01_nic_private_ip

  jenkins_linux_02_dns_prefix       = var.jenkins_linux_02_dns_prefix
  jenkins_linux_02_nic_private_ip   = module.jenkins_linux_02.jenkins_linux_02_nic_private_ip

  jira_dns_prefix       = var.jira_dns_prefix
  jira_nic_private_ip   = module.jira.jira_nic_private_ip

  platform_dns_prefix       = var.platform_dns_prefix
  platform_nic_private_ip   = module.platform.platform_nic_private_ip

  sqlserver_dns_prefix       = var.sqlserver_dns_prefix
  sqlserver_nic_private_ip   = module.mssqlserver.sqlserver_nic_private_ip

  bitdefender_dns_prefix       = var.bitdefender_dns_prefix
  bitdefender_nic_private_ip   = module.bitdefender.bitdefender_nic_private_ip

  sh_dns_prefix       = var.sh_dns_prefix
  sh_nic_private_ip   = module.selenium_hub.sh_nic_private_ip

  si_dns_prefix       = var.si_dns_prefix
  si_nic_private_ip   = module.selenium_ie.si_nic_private_ip

  sc_dns_prefix       = var.sc_dns_prefix
  sc_nic_private_ip   = module.selenium_chrome.sc_nic_private_ip

  sf_dns_prefix       = var.sf_dns_prefix
  sf_nic_private_ip   = module.selenium_firefox.sf_nic_private_ip

  sonarqube_dns_prefix       = var.sonarqube_dns_prefix
  sonarqube_nic_private_ip   = module.sonarqube.sonarqube_nic_private_ip

  ansible_dns_prefix       = var.ansible_dns_prefix
  ansible_nic_private_ip   = module.ansible.ansible_nic_private_ip

  semmle_dns_prefix       = var.semmle_dns_prefix
  semmle_nic_private_ip   = module.semmle.semmle_nic_private_ip

  semmle_windows_01_dns_prefix       = var.semmle_windows_01_dns_prefix
  semmle_windows_01_nic_private_ip   = module.semmle_windows_01.semmle_windows_01_nic_private_ip

  }

module "public_ip" {
  source                  = "./modules/public_ip"
  depends_on                  = [module.private_dns]
  network_rg_name             = module._name_syntax.network_rg_name
  location                    = var.location
  firewall_public_ip_name     = module._name_syntax.firewall_public_ip_name 
  platform_public_ip_name     = module._name_syntax.platform_public_ip_name
  jira_public_ip_name         = module._name_syntax.jira_public_ip_name
  jenkins_public_ip_name      = module._name_syntax.jenkins_public_ip_name
  ghe_public_ip_name          = module._name_syntax.ghe_public_ip_name
  jfrog_public_ip_name        = module._name_syntax.jfrog_public_ip_name
  sonarqube_public_ip_name    = module._name_syntax.sonarqube_public_ip_name
}
# ---------------------------- Redis Cache ---------------------------#
module "rediscache" {
  source                            = "./modules/rediscache"
  depends_on                        = [module.public_ip]
  rediscache_name                   = module._name_syntax.rediscache_name
  location                          = var.location
  main_rg_name                      = module._main_rg.main_rg_name
  rediscache_ssl_port               = var.rediscache_ssl_port
  rediscache_subnet_id              = module.subnets.rediscache_subnet_id
  rediscache_capacity               = var.rediscache_capacity
  rediscache_family                  = var.rediscache_family
  rediscache_sku                    = var.rediscache_sku
}

module "firewall" {
  source                  = "./modules/firewall"
  depends_on              = [module.rediscache]
  firewall_name           = var.firewall_name
  network_rg_name         = module._name_syntax.network_rg_name
  location                = var.location
  azurefirewallsubnet_id  = module.subnets.azurefirewallsubnet_id
  firewall_public_ip_id   = module.public_ip.firewall_public_ip_id

  jfrog_public_ip_id      = module.public_ip.jfrog_public_ip_id
  jfrog_public_ip_address = module.public_ip.jfrog_public_ip_address
  jfrog_nic_private_ip    = module.jfrog.jfrog_nic_private_ip

  sonarqube_public_ip_id   = module.public_ip.sonarqube_public_ip_id
  sonarqube_public_ip_address = module.public_ip.sonarqube_public_ip_address
  sonarqube_nic_private_ip    = module.sonarqube.sonarqube_nic_private_ip

  ghe_public_ip_id          = module.public_ip.ghe_public_ip_id
  ghe_public_ip_address     = module.public_ip.ghe_public_ip_address
  ghe_nic_private_ip        = module.ghe.ghe_nic_private_ip

  jira_public_ip_id         = module.public_ip.jira_public_ip_id
  jira_public_ip_address    = module.public_ip.jira_public_ip_address
  jira_nic_private_ip       = module.jira.jira_nic_private_ip

  jenkins_public_ip_id      = module.public_ip.jenkins_public_ip_id
  jenkins_public_ip_address = module.public_ip.jenkins_public_ip_address
  jenkins_nic_private_ip    = module.jenkins.jenkins_nic_private_ip

  platform_public_ip_id      = module.public_ip.platform_public_ip_id
  platform_public_ip_address = module.public_ip.platform_public_ip_address
  platform_nic_private_ip    = module.platform.platform_nic_private_ip  

  network_address_space       = var.network_address_space

  bh_subnet_id	                =	module.subnets.bh_subnet_id
  bitdefender_subnet_id	        =	module.subnets.bitdefender_subnet_id
  jfrog_subnet_id	              =	module.subnets.jfrog_subnet_id
  ghe_subnet_id	                =	module.subnets.ghe_subnet_id
  jira_subnet_id	              =	module.subnets.jira_subnet_id
  jenkins_subnet_id	            =	module.subnets.jenkins_subnet_id
  sonarqube_subnet_id	          =	module.subnets.sonarqube_subnet_id
  selenium_subnet_id	          =	module.subnets.selenium_subnet_id
  ansible_subnet_id	            =	module.subnets.ansible_subnet_id
  sqlserver_subnet_id	          =	module.subnets.sqlserver_subnet_id
  platform_subnet_id	          =	module.subnets.platform_subnet_id
  rediscache_subnet_id	        =	module.subnets.rediscache_subnet_id
  semmle_subnet_id	            =	module.subnets.semmle_subnet_id
}

module "backup" {
  source                      = "./modules/backup"
  depends_on                  = [module.firewall]
  utilities_rg_name           = module._main_rg.utilities_rg_name
  rsv_name                    = module.rsv.rsv_name
  backup_policy_id            = module.rsv.backup_policy_id
  jira_vm_id                    = module.jira.jira_vm_id
  platform_vm_id                = module.platform.platform_vm_id
  semmle_vm_id                  = module.semmle.semmle_vm_id
  ansible_vm_id                 = module.ansible.ansible_vm_id
  jenkins_vm_id                 = module.jenkins.jenkins_vm_id
  jenkins_linux_01_vm_id        = module.jenkins_linux_01.jenkins_linux_01_vm_id
  jenkins_linux_02_vm_id        = module.jenkins_linux_02.jenkins_linux_02_vm_id
  # bitdefender_vm_id             = module.bitdefender.bitdefender_vm_id
}

