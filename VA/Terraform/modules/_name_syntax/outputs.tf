# Resource Group
output "main_rg_name" {
  value = "${var.main_rg_name}-${var.location_prefix}"
}
output "network_rg_name" {
  value = "${var.network_rg_name}-${var.location_prefix}"
}
output "utilities_rg_name" {
  value = "${var.utilities_rg_name}-${var.location_prefix}"
}

# Log Analytics
output "la_name" {
  value = "${var.la_name}-${var.location_prefix}"
}

#Virtual Network
output "network_name" {
  value = "${var.network_name}-${var.location_prefix}"
}

# Storage accounts
output "stshared_name" {
  value = lower("${var.stshared_name}${var.location_prefix}")
}
output "stdiag_name" {
  value = lower("${var.stdiag_name}${var.location_prefix}")
}
output "stnetdiag_name" {
  value = lower("${var.stnetdiag_name}${var.location_prefix}")
}
output "stjfrog_name" {
  value = lower("${var.stjfrog_name}${var.location_prefix}")
}

#Recovery Service Vault Name
output "rsv_name" {
  value = "${var.rsv_name}-${var.location_prefix}"
}

#Key Vault Name
output "kv_name" {
  value = "${var.kv_name}-${var.location_prefix}"
}

#KAutomation Account Name
output "aa_name" {
  value = "${var.aa_name}-${var.location_prefix}"
}

#NSG
output "bh_nsg_name" {
  value = "${var.bh_instance_name}-NSG-${var.location_prefix}"
}

output "jfrog_nsg_name" {
  value = "${var.jfrog_instance_name}-NSG-${var.location_prefix}"
}

output "ghe_nsg_name" {
  value = "${var.ghe_instance_name}-NSG-${var.location_prefix}"
}

output "jenkins_nsg_name" {
  value = "${var.jenkins_instance_name}-NSG-${var.location_prefix}"
}

output "jira_nsg_name" {
  value = "${var.jira_instance_name}-NSG-${var.location_prefix}"
}

output "platform_nsg_name" {
  value = "${var.platform_instance_name}-NSG-${var.location_prefix}"
}

output "sqlserver_nsg_name" {
  value = "${var.sqlserver_instance_name}-NSG-${var.location_prefix}"
}

output "bitdefender_nsg_name" {
  value = "${var.bitdefender_instance_name}-NSG-${var.location_prefix}"
}

output "sonarqube_nsg_name" {
  value = "${var.sonarqube_instance_name}-NSG-${var.location_prefix}"
}

output "selenium_nsg_name" {
  value = "Selenium-NSG-${var.location_prefix}"
}
output "ansible_nsg_name" {
  value = "${var.ansible_instance_name}-NSG-${var.location_prefix}"
}
output "semmle_nsg_name" {
  value = "${var.semmle_instance_name}-NSG-${var.location_prefix}"
}
output "rediscache_nsg_name" {
  value = "RedisCache-NSG-${var.location_prefix}"
}
####Redis cache 
 
output "rediscache_name" {
  value = "${var.rediscache_name}-${var.location_prefix}"
}
#Bastion Host
output "bh_nic_name" {
  value = "${var.bh_instance_name}-NIC-${var.location_prefix}"
}

output "bh_vm_name" {
  value = "VM-${var.bh_instance_name}-${var.location_prefix}"
}

output "bh_os_disk_name" {
  value = "VM-${var.bh_instance_name}-OSDisk-01-${var.location_prefix}"
}

#jFrog
output "jfrog_nic_name" {
  value = "${var.jfrog_instance_name}-NIC-${var.location_prefix}"
}

output "jfrog_vm_name" {
  value = "VM-${var.jfrog_instance_name}-${var.location_prefix}"
}

output "jfrog_os_disk_name" {
  value = "VM-${var.jfrog_instance_name}-OSDisk-01-${var.location_prefix}"
}

#Selenium Hub 
output "sh_nic_name" {
  value = "${var.sh_instance_name}-NIC-${var.location_prefix}"
}

output "sh_vm_name" {
  value = "VM-${var.sh_instance_name}-${var.location_prefix}"
}

output "sh_os_disk_name" {
  value = "VM-${var.sh_instance_name}-OSDisk-01-${var.location_prefix}"
}

#sc
output "sc_nic_name" {
  value = "${var.sc_instance_name}-NIC-${var.location_prefix}"
}

output "sc_vm_name" {
  value = "VM-${var.sc_instance_name}-${var.location_prefix}"
}

output "sc_os_disk_name" {
  value = "VM-${var.sc_instance_name}-OSDisk-01-${var.location_prefix}"
}

#sf
output "sf_nic_name" {
  value = "${var.sf_instance_name}-NIC-${var.location_prefix}"
}

output "sf_vm_name" {
  value = "VM-${var.sf_instance_name}-${var.location_prefix}"
}

output "sf_os_disk_name" {
  value = "VM-${var.sf_instance_name}-OSDisk-01-${var.location_prefix}"
}

#si
output "si_nic_name" {
  value = "${var.si_instance_name}-NIC-${var.location_prefix}"
}

output "si_vm_name" {
  value = "VM-${var.si_instance_name}-${var.location_prefix}"
}

output "si_os_disk_name" {
  value = "VM-${var.si_instance_name}-OSDisk-01-${var.location_prefix}"
}

#sonarqube
output "sonarqube_nic_name" {
  value = "${var.sonarqube_instance_name}-NIC-${var.location_prefix}"
}

output "sonarqube_vm_name" {
  value = "VM-${var.sonarqube_instance_name}-${var.location_prefix}"
}

output "sonarqube_os_disk_name" {
  value = "VM-${var.sonarqube_instance_name}-OSDisk-01-${var.location_prefix}"
}

output "sonarqube_data_disk_name" {
  value = "VM-${var.sonarqube_instance_name}-DataDisk-01-${var.location_prefix}"
}

#Jenkins Windows worker 01
output "jenkins_windows_01_nic_name" {
  value = "${var.jenkins_windows_01_instance_name}-NIC-${var.location_prefix}"
}

output "jenkins_windows_01_vm_name" {
  value = "VM-${var.jenkins_windows_01_instance_name}-${var.location_prefix}"
}

output "jenkins_windows_01_os_disk_name" {
  value = "VM-${var.jenkins_windows_01_instance_name}-OSDisk-01-${var.location_prefix}"
}

#semmle Windows worker 01
output "semmle_windows_01_nic_name" {
  value = "${var.semmle_windows_01_instance_name}-NIC-${var.location_prefix}"
}

output "semmle_windows_01_vm_name" {
  value = "VM-${var.semmle_windows_01_instance_name}-${var.location_prefix}"
}

output "semmle_windows_01_os_disk_name" {
  value = "VM-${var.semmle_windows_01_instance_name}-OSDisk-01-${var.location_prefix}"
}

#sqlserver
output "sqlserver_nic_name" {
  value = "${var.sqlserver_instance_name}-NIC-${var.location_prefix}"
}

output "sqlserver_vm_name" {
  value = "VM-${var.sqlserver_instance_name}-${var.location_prefix}"
}

output "sqlserver_os_disk_name" {
  value = "VM-${var.sqlserver_instance_name}-OSDisk-01-${var.location_prefix}"
}

output "sqlserver_data_disk01_name" {
  value = "VM-${var.sqlserver_instance_name}-DataDisk-01-${var.location_prefix}"
}

#ghe
output "ghe_nic_name" {
  value = "${var.ghe_instance_name}-NIC-${var.location_prefix}"
}

output "ghe_vm_name" {
  value = "VM-${var.ghe_instance_name}-${var.location_prefix}"
}

output "ghe_os_disk_name" {
  value = "VM-${var.ghe_instance_name}-OSDisk-01-${var.location_prefix}"
}

output "ghe_data_disk_name" {
  value = "VM-${var.ghe_instance_name}-DataDisk-01-${var.location_prefix}"
}

#jira
output "jira_nic_name" {
  value = "${var.jira_instance_name}-NIC-${var.location_prefix}"
}

output "jira_vm_name" {
  value = "VM-${var.jira_instance_name}-${var.location_prefix}"
}

output "jira_os_disk_name" {
  value = "VM-${var.jira_instance_name}-OSDisk-01-${var.location_prefix}"
}

# output "jira_data_disk_name" {
#   value = "VM-${var.jira_instance_name}-DataDisk-01-${var.location_prefix}"
# }

#platform
output "platform_nic_name" {
  value = "${var.platform_instance_name}-NIC-${var.location_prefix}"
}

output "platform_vm_name" {
  value = "VM-${var.platform_instance_name}-${var.location_prefix}"
}

output "platform_os_disk_name" {
  value = "VM-${var.platform_instance_name}-OSDisk-01-${var.location_prefix}"
}

# output "platform_data_disk_name" {
#   value = "VM-${var.platform_instance_name}-DataDisk-01-${var.location_prefix}"
# }

#semmle
output "semmle_nic_name" {
  value = "${var.semmle_instance_name}-NIC-${var.location_prefix}"
}

output "semmle_vm_name" {
  value = "VM-${var.semmle_instance_name}-${var.location_prefix}"
}

output "semmle_os_disk_name" {
  value = "VM-${var.semmle_instance_name}-OSDisk-01-${var.location_prefix}"
}

#ansible
output "ansible_nic_name" {
  value = "${var.ansible_instance_name}-NIC-${var.location_prefix}"
}

output "ansible_vm_name" {
  value = "VM-${var.ansible_instance_name}-${var.location_prefix}"
}

output "ansible_os_disk_name" {
  value = "VM-${var.ansible_instance_name}-OSDisk-01-${var.location_prefix}"
}

#jenkins
output "jenkins_nic_name" {
  value = "${var.jenkins_instance_name}-NIC-${var.location_prefix}"
}

output "jenkins_vm_name" {
  value = "VM-${var.jenkins_instance_name}-${var.location_prefix}"
}

output "jenkins_os_disk_name" {
  value = "VM-${var.jenkins_instance_name}-OSDisk-01-${var.location_prefix}"
}

#jenkins_linux_01
output "jenkins_linux_01_nic_name" {
  value = "${var.jenkins_linux_01_instance_name}-NIC-${var.location_prefix}"
}

output "jenkins_linux_01_vm_name" {
  value = "VM-${var.jenkins_linux_01_instance_name}-${var.location_prefix}"
}

output "jenkins_linux_01_os_disk_name" {
  value = "VM-${var.jenkins_linux_01_instance_name}-OSDisk-01-${var.location_prefix}"
}

#jenkins_linux_02
output "jenkins_linux_02_nic_name" {
  value = "${var.jenkins_linux_02_instance_name}-NIC-${var.location_prefix}"
}

output "jenkins_linux_02_vm_name" {
  value = "VM-${var.jenkins_linux_02_instance_name}-${var.location_prefix}"
}

output "jenkins_linux_02_os_disk_name" {
  value = "VM-${var.jenkins_linux_02_instance_name}-OSDisk-01-${var.location_prefix}"
}

#bitdefender
output "bitdefender_nic_name" {
  value = "${var.bitdefender_instance_name}-NIC-${var.location_prefix}"
}

output "bitdefender_vm_name" {
  value = "VM-${var.bitdefender_instance_name}-${var.location_prefix}"
}

output "bitdefender_os_disk_name" {
  value = "VM-${var.bitdefender_instance_name}-OSDisk-01-${var.location_prefix}"
}

#Public IP Names
#Firewall
output "firewall_public_ip_name" {
  value = "FW-PIP-${var.location_prefix}"
}
 #Platform
 output "platform_public_ip_name" {
  value = "${var.platform_instance_name}-FW-PIP-${var.location_prefix}"
}
 #jira
 output "jira_public_ip_name" {
  value = "${var.jira_instance_name}-FW-PIP-${var.location_prefix}"
}
 #jenkins
 output "jenkins_public_ip_name" {
  value = "${var.jenkins_instance_name}-FW-PIP-${var.location_prefix}"
}
 #ghe
 output "ghe_public_ip_name" {
  value = "${var.ghe_instance_name}-FW-PIP-${var.location_prefix}"
}
 #jfrog
 output "jfrog_public_ip_name" {
  value = "${var.jfrog_instance_name}-FW-PIP-${var.location_prefix}"
}
 #sonarqube
 output "sonarqube_public_ip_name" {
  value = "${var.sonarqube_instance_name}-FW-PIP-${var.location_prefix}"
}