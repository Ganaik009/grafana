variable "network_rg_name" {
  type        = string
  description = "The name of the Network resource group"
}

variable "location" {}

variable "firewall_public_ip_name" {}
variable "platform_public_ip_name" {}
variable "jira_public_ip_name" {}
variable "jenkins_public_ip_name" {}
variable "ghe_public_ip_name" {}
variable "jfrog_public_ip_name" {}
variable "sonarqube_public_ip_name" {}