resource "azurerm_private_dns_zone" "internal_dns" {
  name                = var.dns_zone_name
  resource_group_name = var.network_rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnet_link" {
  name                  = "vnet_link"
  resource_group_name   = var.network_rg_name
  private_dns_zone_name = azurerm_private_dns_zone.internal_dns.name
  virtual_network_id    = var.virtual_network_id
}

resource "azurerm_private_dns_a_record" "bh_dns_name" {
  depends_on = [azurerm_private_dns_zone.internal_dns]
  name                = var.bh_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.bh_nic_private_ip]
}

resource "azurerm_private_dns_a_record" "jfrog_dns_name" {
  name                = var.jfrog_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.jfrog_nic_private_ip]
}

resource "azurerm_private_dns_a_record" "ghe_dns_name" {
  name                = var.ghe_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.ghe_nic_private_ip]
}

resource "azurerm_private_dns_a_record" "jenkins_dns_name" {
  name                = var.jenkins_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.jenkins_nic_private_ip]
}

resource "azurerm_private_dns_a_record" "jenkins_windows_01_dns_name" {
  name                = var.jenkins_windows_01_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.jenkins_windows_01_nic_private_ip]
}

resource "azurerm_private_dns_a_record" "jenkins_linux_01_dns_name" {
  name                = var.jenkins_linux_01_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.jenkins_linux_01_nic_private_ip]
}

resource "azurerm_private_dns_a_record" "jenkins_linux_02_dns_name" {
  name                = var.jenkins_linux_02_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.jenkins_linux_02_nic_private_ip]
}

resource "azurerm_private_dns_a_record" "jira_dns_name" {
  name                = var.jira_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.jira_nic_private_ip]
}

resource "azurerm_private_dns_a_record" "platform_dns_name" {
  name                = var.platform_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.platform_nic_private_ip]
}

resource "azurerm_private_dns_a_record" "sqlserver_dns_name" {
  name                = var.sqlserver_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.sqlserver_nic_private_ip]
}

resource "azurerm_private_dns_a_record" "bitdefender_dns_name" {
  name                = var.bitdefender_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.bitdefender_nic_private_ip]
}

resource "azurerm_private_dns_a_record" "sh_dns_name" {
  name                = var.sh_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.sh_nic_private_ip]
}

resource "azurerm_private_dns_a_record" "si_dns_name" {
  name                = var.si_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.si_nic_private_ip]
}

resource "azurerm_private_dns_a_record" "sc_dns_name" {
  name                = var.sc_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.sc_nic_private_ip]
}

resource "azurerm_private_dns_a_record" "sf_dns_name" {
  name                = var.sf_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.sf_nic_private_ip]
}

resource "azurerm_private_dns_a_record" "sonarqube_dns_name" {
  name                = var.sonarqube_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.sonarqube_nic_private_ip]
}

resource "azurerm_private_dns_a_record" "ansible_dns_name" {
  name                = var.ansible_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.ansible_nic_private_ip]
}

resource "azurerm_private_dns_a_record" "semmle_dns_name" {
  name                = var.semmle_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.semmle_nic_private_ip]
}

resource "azurerm_private_dns_a_record" "semmle_windows_01_dns_name" {
  name                = var.semmle_windows_01_dns_prefix
  zone_name           = azurerm_private_dns_zone.internal_dns.name
  resource_group_name = var.network_rg_name
  ttl                 = 10
  records             = [var.semmle_windows_01_nic_private_ip]
}