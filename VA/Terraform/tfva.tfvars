tt_support_email = "support@xxx"
tt_support_name = "Support - XXX"
tt_support_phone = "703 999 9999"

location = "usgovvirginia" #Azure Region. Valid entries are usgovvirginia, usgovtexas, eastus, westus2 etc.
location_prefix = "VA" #Used for name syntaxes to reflect the naming convention
#----------Resource Groups ---------- #
main_rg_name = "ATN-RG" #Omit the location prefix (ie: VA, EUS) here as it is being coded in the _name_syntax module
network_rg_name = "_ATN-Network" #Omit the location prefix (ie: VA, EUS) here as it is being coded in the _name_syntax module
utilities_rg_name = "_ATN-Utilities" #Omit the location prefix (ie: VA, EUS) here as it is being coded in the _name_syntax module


# ----Commong tags -----------------
environment_tag_value = "Dev/Test"
createdby_tag_value = "TN"
#createddate_tag_value = formatdate("DD-MM-YYYY", timestamp())

# ----Dedicated Tags ----------------
tag1_key = "First Dedicated"
tag1_value = "Bastion Host"
tag2_key = "  "
tag2_value = "  "
tag3_key = "  "
tag3_value = "  "

#----------Log Analytics ---------- #
la_name                = "LA5" #Omit the location prefix (ie: VA, EUS) here as it is being coded in the _name_syntax module
la_sku                 = "PerGB2018" # (Optional) Possible values are Free, PerNode, Premium, Standard, Standalone, Unlimited, and PerGB2018 (new Sku as of 2018-04-03). Defaults to PerGB2018
la_retention_in_days   = 365 #(Optional) The workspace data retention in days. Possible values are between 7 and 730.

#Instance Names
# Used for creating name syntax, relevant to the approved naming convention. Windows instances should be less than 9 (needs to be less if project prefix needed) characters. 

bh_instance_name                    = "BH"
ghe_instance_name                   = "GHE"
jenkins_instance_name               = "Jenkins"
jenkins_windows_01_instance_name    = "JSWin01"
jenkins_linux_01_instance_name      = "JSLinux01"
jenkins_linux_02_instance_name      = "JSLinux02"
jfrog_instance_name                 = "jFrog"
jira_instance_name                  = "Jira"
platform_instance_name              = "Platform"
sqlserver_instance_name             = "SQLServer"
bitdefender_instance_name           = "Bitdefender"
sonarqube_instance_name             = "SQ"
sh_instance_name                    = "SH"
sc_instance_name                    = "SC"
si_instance_name                    = "SI"
sf_instance_name                    = "SF"
ansible_instance_name               = "Ansible"
semmle_instance_name                = "Semmle"
semmle_windows_01_instance_name     = "SemWin"

# Network
network_name = "VNET" #Omit the location prefix (ie: VA, EUS) here as it is being coded in the _name_syntax module
network_address_space = "10.0.0.0/23"

#----------Subnets ---------- #
# Subnet prefixes
azurefirewallsubnet_prefixes            = "10.0.1.0/26"
gatewaysubnet_prefixes                  = "10.0.1.64/28"
bh_subnet_prefixes                      = "10.0.0.0/27"
bitdefender_subnet_prefixes             = "10.0.0.32/28"
jfrog_subnet_prefixes                   = "10.0.0.48/28"
ghe_subnet_prefixes                     = "10.0.0.64/28"
jira_subnet_prefixes                    = "10.0.0.80/28"
jenkins_subnet_prefixes                 = "10.0.0.96/28"
sonarqube_subnet_prefixes               = "10.0.0.112/28"
selenium_subnet_prefixes                = "10.0.0.128/28"
ansible_subnet_prefixes                 = "10.0.0.144/28"
sqlserver_subnet_prefixes               = "10.0.0.160/28"
platform_subnet_prefixes                = "10.0.0.176/28"
rediscache_subnet_prefixes              = "10.0.0.192/28"
semmle_subnet_prefixes                  = "10.0.0.208/28"
#Subnet Names
#azurefirewallsubnet_name               = "" It is hardcoded in the script due to Azure restriction
#gatewaysubnet_name                     = "" It is hardcoded in the script due to Azure restriction
bh_subnet_name                          = "BH-Subnet"
bitdefender_subnet_name                 = "Bitdefender-Subnet"
jfrog_subnet_name                       = "jFrog-Subnet"
ghe_subnet_name                         = "GHE-Subnet"
jira_subnet_name                        = "Jira-Subnet"
jenkins_subnet_name                     = "Jenkins-Subnet"
sonarqube_subnet_name                   = "SonarQube-Subnet"
selenium_subnet_name                    = "Selenium-Subnet"
ansible_subnet_name                     = "Ansible-Subnet"
sqlserver_subnet_name                   = "SQLServer-Subnet"
platform_subnet_name                    = "Platform-Subnet"
rediscache_subnet_name                  = "RedisCache-Subnet"
semmle_subnet_name                      = "Semmle-Subnet"



#----------Storage Accounts ---------- #

#Shared#
stshared_name = "stshared" #Omit the location prefix (ie: VA, EUS) here as it is being coded in the _name_syntax module
stshared_account_tier   = "Standard" # (Required) Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created.
stshared_access_tier   = "Hot" #Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot
stshared_replication_type = "RAGRS" #(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS.
#Diagnostic#
stdiag_name = "stdiag" #Omit the location prefix (ie: VA, EUS) here as it is being coded in the _name_syntax module
stdiag_account_tier   = "Standard"
stdiag_access_tier   = "Hot"
stdiag_replication_type = "RAGRS"
#Network Diagnostic#
stnetdiag_name = "stnetdiag" #Omit the location prefix (ie: VA, EUS) here as it is being coded in the _name_syntax module
stnetdiag_account_tier   = "Standard"
stnetdiag_access_tier   = "Hot"
stnetdiag_replication_type = "RAGRS"
#jFrog#
stjfrog_name = "stjfrog" #Omit the location prefix (ie: VA, EUS) here as it is being coded in the _name_syntax module
stjfrog_account_tier   = "Standard"
stjfrog_access_tier   = "Hot"
stjfrog_replication_type = "RAGRS"
#Storage Container#
storage_container_name = "vhdload"
storage_container_access_type = "blob"
bitdefender_blob_source_uri = "XXX"

#----------Redis Cache ---------- #
rediscache_name = "tn-rcplatform"      #Must be unique accross Azure. (Required) The name of the Redis instance. Changing this forces a new resource to be created.
rediscache_ssl_port = "6380"    #Don't change! The SSL Port of the Redis Instance is not configurable from terraform for now.
rediscache_sku =   "Premium"         #The SKU of Redis used. Possible values are Basic, Standard and Premium
rediscache_capacity = 1 #(Required) The size of the Redis cache to deploy. Valid values for a Premium SKU are 1, 2, 3, 4
rediscache_family = "P" # (Required) The SKU family/pricing group to use. Valid value is P (Premium is needed for Vnet deployment)



#KeyVault
kv_name = "KV"
kv_sku = "standard"
kv_enable_disk_encryption = true
kv_enable_soft_delete = true
kv_soft_delete_retention_days = 14
kv_enable_purge_protection = false
kv_key_permissions = [
                    "get",
                    "backup", 
                    "create", 
                    "decrypt", 
                    "delete", 
                    "encrypt", 
                    "import", 
                    "list", 
                    "purge", 
                    "recover", 
                    "restore", 
                    "sign", 
                    "unwrapKey", 
                    "update", 
                    "verify",
                    "wrapKey",
                    ] # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault#certificate_permissions
kv_secret_permissions = [
                        "backup", 
                        "delete", 
                        "get", 
                        "list", 
                        "purge", 
                        "recover", 
                        "restore", 
                        "set",
                        ]
kv_storage_permissions = [
                        "backup", 
                        "delete", 
                        "deletesas", 
                        "get", 
                        "getsas", 
                        "list", 
                        "listsas", 
                        "purge", 
                        "recover", 
                        "regeneratekey", 
                        "restore", 
                        "set", 
                        "setsas", 
                        "update",
                        ]
kv_certificate_permissions =    [
                                "backup", 
                                "create", 
                                "delete", 
                                "deleteissuers", 
                                "get", 
                                "getissuers", 
                                "import", 
                                "list", 
                                "listissuers", 
                                "managecontacts", 
                                "manageissuers", 
                                "purge", 
                                "recover", 
                                "restore", 
                                "setissuers", 
                                "update",
                                ]

kv_network_acls_default_action = "Deny"
kv_network_acls_bypass = "AzureServices"

#automation account
aa_name = "AutomationAccount"
aa_sku = "Basic" #Dont Change!!!!. Only basic is supported for now

#bastion Host
bh_vm_size                      = "Standard_DS3_v2"           
bh_vm_os_disk_caching           = "ReadWrite"           
bh_vm_os_disk_storage_account_type = "Premium_LRS"
bh_vm_source_image_publisher    = "MicrosoftWindowsServer"
bh_vm_source_image_offer        = "WindowsServer"
bh_vm_source_image_sku          = "2019-Datacenter"
bh_vm_source_image_version      = "latest"

#jFrog VM
jfrog_vm_size                      = "Standard_F8s"           
jfrog_vm_os_disk_caching           = "ReadWrite"           
jfrog_vm_os_disk_storage_account_type = "Premium_LRS"
jfrog_vm_source_image_publisher    = "MicrosoftWindowsServer"
jfrog_vm_source_image_offer        = "WindowsServer"
jfrog_vm_source_image_sku          = "2019-Datacenter"
jfrog_vm_source_image_version      = "latest"

#Selenium Hub VM
sh_vm_size                      = "Standard_DS2_v2"           
sh_vm_os_disk_caching           = "ReadWrite"           
sh_vm_os_disk_storage_account_type = "Premium_LRS"
sh_vm_source_image_publisher    = "MicrosoftWindowsServer"
sh_vm_source_image_offer        = "WindowsServer"
sh_vm_source_image_sku          = "2019-Datacenter"
sh_vm_source_image_version      = "latest"
#Selenium Chrome VM
sc_vm_size                      = "Standard_DS2_v2"         
sc_vm_os_disk_caching           = "ReadWrite"           
sc_vm_os_disk_storage_account_type = "Premium_LRS"
sc_vm_source_image_publisher    = "MicrosoftWindowsServer"
sc_vm_source_image_offer        = "WindowsServer"
sc_vm_source_image_sku          = "2019-Datacenter"
sc_vm_source_image_version      = "latest"
#Selenium Firefox VM
sf_vm_size                      = "Standard_DS2_v2"         
sf_vm_os_disk_caching           = "ReadWrite"           
sf_vm_os_disk_storage_account_type = "Premium_LRS"
sf_vm_source_image_publisher    = "MicrosoftWindowsServer"
sf_vm_source_image_offer        = "WindowsServer"
sf_vm_source_image_sku          = "2019-Datacenter"
sf_vm_source_image_version      = "latest"
#Selenium IE VM
si_vm_size                      = "Standard_DS2_v2"         
si_vm_os_disk_caching           = "ReadWrite"           
si_vm_os_disk_storage_account_type = "Premium_LRS"
si_vm_source_image_publisher    = "MicrosoftWindowsServer"
si_vm_source_image_offer        = "WindowsServer"
si_vm_source_image_sku          = "2019-Datacenter"
si_vm_source_image_version      = "latest"
#sonarqube VM
sonarqube_vm_size                      = "Standard_DS4_v2"           
sonarqube_vm_os_disk_caching           = "ReadWrite"           
sonarqube_vm_os_disk_storage_account_type = "Premium_LRS"
sonarqube_vm_data_disk_caching           = "ReadWrite"           
sonarqube_vm_data_disk_storage_account_type = "Premium_LRS"
sonarqube_vm_data_disk_size_gb          = "1024"           
sonarqube_vm_data_disk_lun              = "01"
sonarqube_vm_source_image_publisher    = "MicrosoftWindowsServer"
sonarqube_vm_source_image_offer        = "WindowsServer"
sonarqube_vm_source_image_sku          = "2019-Datacenter"
sonarqube_vm_source_image_version      = "latest"

#jenkins_windows_01 VM
jenkins_windows_01_vm_size                      = "Standard_DS3_v2"           
jenkins_windows_01_vm_os_disk_caching           = "ReadWrite"           
jenkins_windows_01_vm_os_disk_storage_account_type = "Premium_LRS"
jenkins_windows_01_vm_source_image_publisher    = "MicrosoftWindowsServer"
jenkins_windows_01_vm_source_image_offer        = "WindowsServer"
jenkins_windows_01_vm_source_image_sku          = "2019-Datacenter"
jenkins_windows_01_vm_source_image_version      = "latest"

#semmle_windows_01 VM
semmle_windows_01_vm_size                      = "Standard_DS2_v2"           
semmle_windows_01_vm_os_disk_caching           = "ReadWrite"           
semmle_windows_01_vm_os_disk_storage_account_type = "Premium_LRS"
semmle_windows_01_vm_source_image_publisher    = "MicrosoftWindowsServer"
semmle_windows_01_vm_source_image_offer        = "WindowsServer"
semmle_windows_01_vm_source_image_sku          = "2019-Datacenter"
semmle_windows_01_vm_source_image_version      = "latest"

#sqlserver VM
sqlserver_vm_size                      = "Standard_DS3_v2"           
sqlserver_vm_os_disk_caching           = "ReadWrite"           
sqlserver_vm_os_disk_storage_account_type = "Premium_LRS"
sqlserver_vm_data_disk01_caching           = "ReadWrite"           
sqlserver_vm_data_disk01_storage_account_type = "Premium_LRS"
sqlserver_vm_data_disk01_size_gb          = "1024"           
sqlserver_vm_data_disk01_lun              = "01"
sqlserver_vm_source_image_publisher    = "MicrosoftSQLServer"
sqlserver_vm_source_image_offer        = "SQL2017-WS2016"
sqlserver_vm_source_image_sku          = "Enterprise"
sqlserver_vm_source_image_version      = "latest"
sql_license_type = "PAYG"
r_services_enabled = "true"
sql_connectivity_port =   "3781"
sql_connectivity_type =   "PRIVATE"

sql_maintenance_day_of_week = "Sunday"
sql_maintenance_window_duration_in_minutes = "60"
sql_maintenance_window_starting_hour = "2"

#ghe VM
ghe_vm_size                      = "Standard_E4s_v3"           
ghe_vm_os_disk_caching           = "ReadWrite"           
ghe_vm_os_disk_storage_account_type = "Premium_LRS"
ghe_vm_data_disk_caching           = "ReadWrite"           
ghe_vm_data_disk_storage_account_type = "Premium_LRS"
ghe_vm_data_disk_size_gb          = "1024"           
ghe_vm_data_disk_lun              = "01"
ghe_vm_source_image_publisher    = "GitHub"
ghe_vm_source_image_offer        = "GitHub-Enterprise"
ghe_vm_source_image_sku          = "GitHub-Enterprise"
ghe_vm_source_image_version      = "latest"

#jira VM
jira_vm_size                      = "Standard_DS2_v2"           
jira_vm_os_disk_caching           = "ReadWrite"           
jira_vm_os_disk_storage_account_type = "Premium_LRS"
jira_vm_source_image_publisher    = "center-for-internet-security-inc"
jira_vm_source_image_offer        = "cis-ubuntu-linux-1804-l1"
jira_vm_source_image_sku          = "cis-ubuntu1804-l1"
jira_vm_source_image_version      = "latest"

jira_vm_plan_name                  = "cis-ubuntu1804-l1"
jira_vm_plan_product               = "cis-ubuntu-linux-1804-l1"    
jira_vm_plan_publisher             = "center-for-internet-security-inc"  

#platform VM
platform_vm_size                      = "Standard_DS2_v2"           
platform_vm_os_disk_caching           = "ReadWrite"           
platform_vm_os_disk_storage_account_type = "Premium_LRS"
platform_vm_source_image_publisher    = "center-for-internet-security-inc"
platform_vm_source_image_offer        = "cis-ubuntu-linux-1804-l1"
platform_vm_source_image_sku          = "cis-ubuntu1804-l1"
platform_vm_source_image_version      = "latest"

platform_vm_plan_name                  = "cis-ubuntu1804-l1"
platform_vm_plan_product               = "cis-ubuntu-linux-1804-l1"    
platform_vm_plan_publisher             = "center-for-internet-security-inc"  

#semmle VM
semmle_vm_size                      = "Standard_DS2_v2"           
semmle_vm_os_disk_caching           = "ReadWrite"           
semmle_vm_os_disk_storage_account_type = "Premium_LRS"
semmle_vm_source_image_publisher    = "center-for-internet-security-inc"
semmle_vm_source_image_offer        = "cis-ubuntu-linux-1804-l1"
semmle_vm_source_image_sku          = "cis-ubuntu1804-l1"
semmle_vm_source_image_version      = "latest"

semmle_vm_plan_name                  = "cis-ubuntu1804-l1"
semmle_vm_plan_product               = "cis-ubuntu-linux-1804-l1"    
semmle_vm_plan_publisher             = "center-for-internet-security-inc"  

#ansible VM
ansible_vm_size                      = "Standard_DS2_v2"           
ansible_vm_os_disk_caching           = "ReadWrite"           
ansible_vm_os_disk_storage_account_type = "Premium_LRS"
ansible_vm_source_image_publisher    = "center-for-internet-security-inc"
ansible_vm_source_image_offer        = "cis-ubuntu-linux-1804-l1"
ansible_vm_source_image_sku          = "cis-ubuntu1804-l1"
ansible_vm_source_image_version      = "latest"

ansible_vm_plan_name                  = "cis-ubuntu1804-l1"
ansible_vm_plan_product               = "cis-ubuntu-linux-1804-l1"    
ansible_vm_plan_publisher             = "center-for-internet-security-inc"  

#jenkins VM
jenkins_vm_size                      = "Standard_DS3_v2"           
jenkins_vm_os_disk_caching           = "ReadWrite"           
jenkins_vm_os_disk_storage_account_type = "Premium_LRS"
jenkins_vm_os_disk_size              = "512"
jenkins_vm_source_image_publisher    = "center-for-internet-security-inc"
jenkins_vm_source_image_offer        = "cis-ubuntu-linux-1804-l1"
jenkins_vm_source_image_sku          = "cis-ubuntu1804-l1"
jenkins_vm_source_image_version      = "latest"

jenkins_vm_plan_name                  = "cis-ubuntu1804-l1"
jenkins_vm_plan_product               = "cis-ubuntu-linux-1804-l1"    
jenkins_vm_plan_publisher             = "center-for-internet-security-inc"  

#jenkins_linux_01 VM
jenkins_linux_01_vm_size                      = "Standard_DS3_v2"           
jenkins_linux_01_vm_os_disk_caching           = "ReadWrite"           
jenkins_linux_01_vm_os_disk_storage_account_type = "Premium_LRS"
jenkins_linux_01_vm_os_disk_size              = "512"
jenkins_linux_01_vm_source_image_publisher    = "center-for-internet-security-inc"
jenkins_linux_01_vm_source_image_offer        = "cis-ubuntu-linux-1804-l1"
jenkins_linux_01_vm_source_image_sku          = "cis-ubuntu1804-l1"
jenkins_linux_01_vm_source_image_version      = "latest"

jenkins_linux_01_vm_plan_name                  = "cis-ubuntu1804-l1"
jenkins_linux_01_vm_plan_product               = "cis-ubuntu-linux-1804-l1"    
jenkins_linux_01_vm_plan_publisher             = "center-for-internet-security-inc" 

#jenkins_linux_02 VM
jenkins_linux_02_vm_size                      = "Standard_DS3_v2"           
jenkins_linux_02_vm_os_disk_caching           = "ReadWrite"           
jenkins_linux_02_vm_os_disk_storage_account_type = "Premium_LRS"
jenkins_linux_02_vm_os_disk_size              = "128"
jenkins_linux_02_vm_source_image_publisher    = "center-for-internet-security-inc"
jenkins_linux_02_vm_source_image_offer        = "cis-ubuntu-linux-1804-l1"
jenkins_linux_02_vm_source_image_sku          = "cis-ubuntu1804-l1"
jenkins_linux_02_vm_source_image_version      = "latest"

jenkins_linux_02_vm_plan_name                  = "cis-ubuntu1804-l1"
jenkins_linux_02_vm_plan_product               = "cis-ubuntu-linux-1804-l1"    
jenkins_linux_02_vm_plan_publisher             = "center-for-internet-security-inc" 
#bitdefender
bitdefender_vm_size                      = "Standard_DS3_v2"   
#private dns
dns_zone_name = "unifiedgoals.com"
bh_dns_prefix = "bh" #i.e: bh.atn-fedgovcloud.us
ghe_dns_prefix = "ghe"
jenkins_dns_prefix = "jenkins"
jenkins_windows_01_dns_prefix = "jswin01"
jenkins_linux_01_dns_prefix = "jslin01"
jenkins_linux_02_dns_prefix = "jslin02"
jfrog_dns_prefix = "jfrog"
jira_dns_prefix = "jira"
platform_dns_prefix = "platform"
sqlserver_dns_prefix = "sql"
bitdefender_dns_prefix = "bitdefender"
sonarqube_dns_prefix = "sq"
sh_dns_prefix = "sh"
si_dns_prefix = "si"
sc_dns_prefix = "sc"
sf_dns_prefix = "sf"
semmle_dns_prefix = "sem"
semmle_windows_01_dns_prefix = "semwin01"
ansible_dns_prefix = "ansible"

#-----------------Firewall---------"

firewall_name = "ATN-Firewall-VA"

#----------Recovery Service Vault ---------- #
#Recovery Service Vault Name
rsv_name = "RSV" #Omit the location prefix (ie: VA, EUS) here as it is being coded in the _name_syntax module

#Backup Policy for the VMs

backup_policy_name = "DailyPolicy" #(Required) Specifies the name of the Backup Policy. Changing this forces a new resource to be created.
backup_policy_timezone = "Eastern Standard Time" #(Optional) Defaults to UTC. Variables: https://jackstromberg.com/2017/01/list-of-time-zones-consumed-by-azure/
backup_policy_frequency = "Daily" #Must be either Daily or Weekly
backup_policy_time = "03:30" #24hour format
backup_retention_daily_count = "30"
backup_retention_weekly_weekdays = "Sunday"
backup_retention_weekly_count = "12"
backup_retention_monthly_weeks = "Last"
backup_retention_monthly_weekdays = "Sunday"
backup_retention_monthly_count = "36"
backup_retention_yearly_months = "January"
backup_retention_yearly_weeks = "First"
backup_retention_yearly_weekdays = "Sunday"
backup_retention_yearly_count = "5"