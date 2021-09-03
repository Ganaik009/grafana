
resource "azurerm_firewall" "firewall" {
   name                      = var.firewall_name
   resource_group_name       = var.network_rg_name
   location                  = var.location
   threat_intel_mode         = "Deny"

  ip_configuration {
    name                 = "FirewallPIP"
    subnet_id            = var.azurefirewallsubnet_id
    public_ip_address_id = var.firewall_public_ip_id
  }
    ip_configuration {
    name                 = "jFrog"
    public_ip_address_id = var.jfrog_public_ip_id
  }
    ip_configuration {
    name                 = "Sonarqube"
    public_ip_address_id = var.sonarqube_public_ip_id
  }
    ip_configuration {
    name                 = "ghe"
    public_ip_address_id = var.ghe_public_ip_id
  }
    ip_configuration {
    name                 = "Jira"
    public_ip_address_id = var.jira_public_ip_id
  }

    ip_configuration {
    name                 = "Platform"
    public_ip_address_id = var.platform_public_ip_id
  }

      ip_configuration {
    name                 = "jenkins"
    public_ip_address_id = var.jenkins_public_ip_id
  }

}

resource "azurerm_route_table" "route_table" {
  depends_on                    = [azurerm_firewall.firewall]
  name                          = "RouteToFirewall"
  location                      = var.location
  resource_group_name           = var.network_rg_name
  disable_bgp_route_propagation = false

  route {
    name           = "RouteToFirewall"
    address_prefix = "0.0.0.0/0"
    next_hop_type  = "VirtualAppliance"
    next_hop_in_ip_address  = azurerm_firewall.firewall.ip_configuration[0].private_ip_address
  }
}
resource "azurerm_subnet_route_table_association" "bh" {
  depends_on = [azurerm_route_table.route_table]
  subnet_id      = var.bh_subnet_id
  route_table_id = azurerm_route_table.route_table.id
}
resource "azurerm_subnet_route_table_association" "bitdefender" {
  depends_on = [azurerm_subnet_route_table_association.bh]
  subnet_id      = var.bitdefender_subnet_id
  route_table_id = azurerm_route_table.route_table.id
}
resource "azurerm_subnet_route_table_association" "jfrog" {
  depends_on = [azurerm_subnet_route_table_association.bitdefender]
  subnet_id      = var.jfrog_subnet_id
  route_table_id = azurerm_route_table.route_table.id
}
resource "azurerm_subnet_route_table_association" "ghe" {
  depends_on = [azurerm_subnet_route_table_association.jfrog]
  subnet_id      = var.ghe_subnet_id
  route_table_id = azurerm_route_table.route_table.id
}
resource "azurerm_subnet_route_table_association" "jira" {
  depends_on = [azurerm_subnet_route_table_association.ghe]
  subnet_id      = var.jira_subnet_id
  route_table_id = azurerm_route_table.route_table.id
}
resource "azurerm_subnet_route_table_association" "jenkins" {
  depends_on = [azurerm_subnet_route_table_association.jira]
  subnet_id      = var.jenkins_subnet_id
  route_table_id = azurerm_route_table.route_table.id
}
resource "azurerm_subnet_route_table_association" "sonarqube" {
  depends_on = [azurerm_subnet_route_table_association.jenkins]
  subnet_id      = var.sonarqube_subnet_id
  route_table_id = azurerm_route_table.route_table.id
}
resource "azurerm_subnet_route_table_association" "selenium" {
  depends_on = [azurerm_subnet_route_table_association.sonarqube]
  subnet_id      = var.selenium_subnet_id
  route_table_id = azurerm_route_table.route_table.id
}
resource "azurerm_subnet_route_table_association" "ansible" {
  depends_on = [azurerm_subnet_route_table_association.selenium]
  subnet_id      = var.ansible_subnet_id
  route_table_id = azurerm_route_table.route_table.id
}
resource "azurerm_subnet_route_table_association" "sqlserver" {
  depends_on = [azurerm_subnet_route_table_association.ansible]
  subnet_id      = var.sqlserver_subnet_id
  route_table_id = azurerm_route_table.route_table.id
}
resource "azurerm_subnet_route_table_association" "platform" {
  depends_on = [azurerm_subnet_route_table_association.sqlserver]
  subnet_id      = var.platform_subnet_id
  route_table_id = azurerm_route_table.route_table.id
}
resource "azurerm_subnet_route_table_association" "rediscache" {
  depends_on = [azurerm_subnet_route_table_association.platform]
  subnet_id      = var.rediscache_subnet_id
  route_table_id = azurerm_route_table.route_table.id
}
resource "azurerm_subnet_route_table_association" "semmle" {
  depends_on = [azurerm_subnet_route_table_association.rediscache]
  subnet_id      = var.semmle_subnet_id
  route_table_id = azurerm_route_table.route_table.id
}

resource "azurerm_firewall_nat_rule_collection" "dnat" {
  depends_on = [azurerm_subnet_route_table_association.semmle]
  name                = "dnat_rules"
  azure_firewall_name = azurerm_firewall.firewall.name
  resource_group_name = var.network_rg_name
  priority            = 100
  action              = "Dnat"

  rule {
    name = "jfrog"
    source_addresses = ["*",]
    destination_ports = ["443",]
    destination_addresses = [var.jfrog_public_ip_address]
    translated_port = "443"
    translated_address = var.jfrog_nic_private_ip
    protocols = [
      "TCP",
      "UDP",
    ]
  }

    rule {
    name = "sonarqube"
    source_addresses = ["*",]
    destination_ports = ["443",]
    destination_addresses = [var.sonarqube_public_ip_address]
    translated_port = "443"
    translated_address = var.sonarqube_nic_private_ip
    protocols = [
      "TCP",
    ]
    }
    rule {
    name = "Platform"
    source_addresses = ["*",]
    destination_ports = ["443",]
    destination_addresses = [var.platform_public_ip_address]
    translated_port = "8443"
    translated_address = var.platform_nic_private_ip
    protocols = [
      "TCP",
    ]
  }

    rule {
    name = "Platform-5000"
    source_addresses = ["*",]
    destination_ports = ["5000",]
    destination_addresses = [var.platform_public_ip_address]
    translated_port = "5000"
    translated_address = var.platform_nic_private_ip
    protocols = [
      "TCP",
    ]
  }
  rule {
    name = "Jira-443"
    source_addresses = ["*",]
    destination_ports = ["443",]
    destination_addresses = [var.jira_public_ip_address]
    translated_port = "8443"
    translated_address = var.jira_nic_private_ip
    protocols = [
      "TCP",
    ]
  }
rule {
    name = "Jenkins-443"
    source_addresses = ["*",]
    destination_ports = ["443",]
    destination_addresses = [var.jenkins_public_ip_address]
    translated_port = "8443"
    translated_address = var.jenkins_nic_private_ip
    protocols = [
      "TCP",
    ]
  }
  rule {
    name = "GHE-443"
    source_addresses = ["*",]
    destination_ports = ["443",]
    destination_addresses = [var.ghe_public_ip_address]
    translated_port = "443"
    translated_address = var.ghe_nic_private_ip
    protocols = [
      "TCP",
    ]
  }
}
 #Network Rule Collection#

 resource "azurerm_firewall_network_rule_collection" "allow-internet" {
  depends_on          = [azurerm_firewall_nat_rule_collection.dnat]
  name                = "Allow-Internet"
  azure_firewall_name = azurerm_firewall.firewall.name
  resource_group_name = var.network_rg_name
  priority            = 200
  action              = "Allow"

  rule {
    name = "HTTPS-SMTP"

    source_addresses = [
      var.network_address_space
    ]

    destination_ports = [
      "443",
      "445",
      "587",
    ]

    destination_addresses = [
      "*",
      ]

    protocols = [
      "TCP",
         ]
  }

  rule {
    name = "TimeServer"

    source_addresses = [
      var.network_address_space
    ]

    destination_ports = [
      "123",
    ]

    destination_addresses = [
      "*",
      ]

    protocols = [
      "UDP",
         ]
  }
}

resource "azurerm_firewall_application_rule_collection" "AllowOSUpdateHTTP" {
  depends_on          = [azurerm_firewall_network_rule_collection.allow-internet]
  name                = "AllowOSUpdateHTTP"
  azure_firewall_name = azurerm_firewall.firewall.name
  resource_group_name = var.network_rg_name
  priority            = 100
  action              = "Allow"

  rule {
    name = "WinOSUpdate"

    source_addresses = [
      var.network_address_space
    ]

    target_fqdns = [
      "*download.windowsupdate.com",
      "*.update.microsoft.com",
      "*.windowsupdate.com",
      "*.windowsupdate.microsoft.com",
      "*.microsoft.com",
      "microsoft.com",
      "update.microsoft.com",
      "*windowsupdate.com",
      "windowsupdate.microsoft.com",
    ]

    protocol {
      port = "80"
      type = "Http"
    }
  }

    rule {
    name = "LinuxOSUpdate-Debian"

    source_addresses = [
      var.network_address_space
    ]

    target_fqdns = [
      "ftp.us.debian.org",
      "security.debian.org",
      "deb.debian.org",
      "*debian.org",
    ]

    protocol {
      port = "80"
      type = "Http"
    }
  }

  rule {
    name = "LinuxOSUpdate-Ubuntu"

    source_addresses = [
      var.network_address_space
    ]

    target_fqdns = [
      "security.ubuntu.com",
      "archive.ubuntu.com",
      "*ubuntu.com",
      "*canonical.com",
      "*launchpad.net",
    ]

    protocol {
      port = "80"
      type = "Http"
    }
  }

  rule {
    name = "LinuxOSUpdate-Jenkins"

    source_addresses = [
      var.network_address_space
    ]

    target_fqdns = [
      "dl.google.com",
      "apt.postgresql.org",
      "apt.puppet.com",
      "deb.nodesource.com",
      "packages.cloudfoundry.org",
      "*.cloudfoundry.org",
    ]

    protocol {
      port = "80"
      type = "Http"
    }
  }

  rule {
    name = "LinuxOSUpdate-Bitdefender"

    source_addresses = [
      var.network_address_space
    ]

    target_fqdns = [
      "*.bitdefender.com",
      "bitdefender.com",
      "*.bitdefender.net",
      "*.bdnsrt.org",
    ]

    protocol {
      port = "80"
      type = "Http"
    }
  }

    rule {
    name = "SSL-Verification"

    source_addresses = [
      var.network_address_space
    ]

    target_fqdns = [
      "*.digicert.com",
      "ocsp.msocsp.com",
      "*.ws.symantec.com",
      "crl.thawte.com",
      "*.symcd.com",
      "*.symcb.com",
      "*.godaddy.com",
      "*.usertrust.com",
      "*.comodoca.com",
      "*.sectigo.com",
      "*.globalsign.net",
       ]

    protocol {
      port = "80"
      type = "Http"
    }
  }
    rule {
    name = "GoogleChrome_Update"

    source_addresses = [
      var.network_address_space
    ]

    target_fqdns = [
      "*.google.com",
      "*.gvt1.com",
       ]

    protocol {
      port = "80"
      type = "Http"
    }
  }
}
