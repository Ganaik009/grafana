locals { 

predefined_linux_nsgrules = {
   
   # Inbound Rules

    SSH = {
      name                       = "In_Allow_SSH"
      priority                   = 300
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [22]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
 
    
    Bitdefender = {
      name                       = "In_Allow_BitdefenderUpdate"
      priority                   = 310
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [7077, 7074, 8443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
 
    # Nessus = {
    #   name                       = "In_Allow_Nessus"
    #   priority                   = 320
    #   direction                  = "Inbound"
    #   access                     = "Allow"
    #   protocol                   = "*"
    #   source_port_range          = "*"
    #   destination_port_ranges     = [139,135,445]
    #   source_address_prefix      = "VirtualNetwork"
    #   destination_address_prefix = "VirtualNetwork"
    # }
    InDenyAll = {
      name                       = "In_Deny_All"
      priority                   = 4050
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_ranges    = ["0-65535"]
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
# Outbound Rules

      NTP = {
      name                       = "Out_Allow_NTP"
      priority                   = 300
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "udp"
      source_port_range          = "*"
      destination_port_ranges    = [123]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
      Bitdefender_out = {
      name                       = "Out_Allow_Bitdefender"
      priority                   = 310
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_ranges    = [7083, 7074, 8443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }  
    OSUpdate = {
      name                       = "Out_Allow_OSUpdate_HTTP80"
      priority                   = 320
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [80]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
        OutDenyAll = {
      name                       = "Out_Deny_All"
      priority                   = 4050
      direction                  = "Outbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_ranges    = ["0-65535"]
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    } 
}

predefined_windows_nsgrules = {
   
   # Inbound Rules

    RDP = {
      name                       = "In_Allow_RDP"
      priority                   = 300
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [3389]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
 
    
    Bitdefender = {
      name                       = "In_Allow_BitdefenderUpdate"
      priority                   = 310
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [7077, 7074, 8443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
 
    Nessus = {
      name                       = "In_Allow_Nessus"
      priority                   = 320
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_ranges     = [139,135,445]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    InDenyAll = {
      name                       = "In_Deny_All"
      priority                   = 4050
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_ranges    = ["0-65535"]
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
# Outbound Rules

      NTP = {
      name                       = "Out_Allow_NTP"
      priority                   = 300
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "udp"
      source_port_range          = "*"
      destination_port_ranges    = [123]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
      Bitdefender_out = {
      name                       = "Out_Allow_Bitdefender"
      priority                   = 310
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_ranges    = [7083, 7074, 8443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }  
    OSUpdate = {
      name                       = "Out_Allow_OSUpdate_HTTP80"
      priority                   = 320
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [80]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
        OutDenyAll = {
      name                       = "Out_Deny_All"
      priority                   = 4050
      direction                  = "Outbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_ranges    = ["0-65535"]
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    } 
}

custom_bh_nsgrules = {
 
    Out_https = {
      name                       = "Out_Allow_HTTPS"
      priority                   = 350
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }

    OutGheVnet = {
      name                       = "Out_Allow_GHE"
      priority                   = 400
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_ranges    = [122,161,8443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }

    Out_vnetSSH = {
      name                       = "Out_Allow_SSH_Vnet"
      priority                   = 410
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [22]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }

        Out_RDP = {
      name                       = "Out_Allow_RDP_Vnet"
      priority                   = 420
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [3389]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
        Out_MSSQL = {
      name                       = "Out_Allow_MSSQLServer"
      priority                   = 430
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [3781]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
   }

   ########################----jfrog custom------------------######################

   custom_jfrog_nsgrules = {
     In_https = {
      name                       = "In_Allow_HTTPS"
      priority                   = 350
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    Out_https = {
      name                       = "Out_Allow_HTTPS"
      priority                   = 350
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
   }

#############----GHE Custom----#######################
       custom_ghe_nsgrules = {
     In_https = {
      name                       = "In_Allow_HTTPS"
      priority                   = 350
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }

     In_vnetSSH = {
      name                       = "In_Allow_VnetSSH"
      priority                   = 410
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [122]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
     In_BH8443 = {
      name                       = "In_Allow_BH_HTTPS_8443"
      priority                   = 420
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [8443]
      source_address_prefix      = "10.0.0.0/27"
      destination_address_prefix = "VirtualNetwork"
    }
     In_BH161 = {
      name                       = "In_Allow_BH_161"
      priority                   = 430
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_ranges    = [161]
      source_address_prefix      = "10.0.0.0/27"
      destination_address_prefix = "VirtualNetwork"
    }
    Out_https = {
      name                       = "Out_Allow_HTTPS"
      priority                   = 350
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    Out_PlatformOAuth = {
      name                       = "Out_Allow_PlatformOAuth"
      priority                   = 400
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [5000]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    Out_Jenkins = {
      name                       = "Out_Allow_Jenkins"
      priority                   = 410
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [22,443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    Out_SMTP = {
      name                       = "Out_Allow_SMTP_587"
      priority                   = 420
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [587]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
   }

   ########################----jenkins custom------------------######################

   custom_jenkins_nsgrules = {
     RDP = {
      name                       = "In_Allow_RDP"
      priority                   = 301
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [3389]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
     In_https = {
      name                       = "In_Allow_HTTPS"
      priority                   = 350
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    In_9090 = {
      name                       = "In_Allow_9090"
      priority                   = 400
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [9090]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    In_5378 = {
      name                       = "In_Allow_5378"
      priority                   = 410
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [5378]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    Out_https = {
      name                       = "Out_Allow_HTTPS"
      priority                   = 350
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    Out_9090 = {
      name                       = "Out_Allow_9090"
      priority                   = 400
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [9090]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    Out_5378 = {
      name                       = "Out_Allow_5378"
      priority                   = 410
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [5378]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    Out_SMTP = {
      name                       = "Out_Allow_SMTP_587"
      priority                   = 420
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [587]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    Out_SSH = {
      name                       = "Out_Allow_SSH_22"
      priority                   = 430
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [22]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
   }

      ########################----jira custom------------------######################

   custom_jira_nsgrules = {
     In_https = {
      name                       = "In_Allow_HTTPS"
      priority                   = 350
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443,8443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
        Out_https = {
      name                       = "Out_Allow_HTTPS"
      priority                   = 350
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    Out_MSSQL = {
      name                       = "Out_Allow_MSSQL"
      priority                   = 400
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [3781]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
      Out_SMTP = {
      name                       = "Out_Allow_SMTP_587"
      priority                   = 420
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [587]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
   }

      
      ########################----platform custom------------------######################

custom_platform_nsgrules = {
     In_https = {
      name                       = "In_Allow_HTTPS"
      priority                   = 350
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443,8443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
     In_5000 = {
      name                       = "In_Allow_5000"
      priority                   = 400
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443,8443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
         In_SQL = {
      name                       = "In_Allow_MSSQL"
      priority                   = 410
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [3781]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
         In_Redis = {
      name                       = "In_Allow_Redis"
      priority                   = 420
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [6380]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
        Out_https = {
      name                       = "Out_Allow_HTTPS"
      priority                   = 350
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    Out_MSSQL = {
      name                       = "Out_Allow_MSSQL"
      priority                   = 400
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [3781]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
      Out_5000 = {
      name                       = "Out_Allow_5000"
      priority                   = 420
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [5000]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
      Out_Redis = {
      name                       = "Out_Allow_Redis"
      priority                   = 430
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_ranges    = ["6379","6380","8443","10221-10231",20226,"13000-13999","15000-15999"]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
   }

         ########################----sqlserver custom------------------######################

custom_sqlserver_nsgrules = {
     In_SQL = {
      name                       = "In_Allow_MSSQL"
      priority                   = 400
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [3781]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
         Out_SQL = {
      name                       = "Out_Allow_MSSQL"
      priority                   = 400
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [3781]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
             Out_https = {
      name                       = "Out_Allow_HTTPS"
      priority                   = 350
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
  }

      ########################----bitdefender custom------------------######################

   custom_bitdefender_nsgrules = {
     In_commserver = {
      name                       = "In_Allow_CommServer"
      priority                   = 400
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [8443,443,7076,1344,6379,7081]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
     In_secserver = {
      name                       = "In_Allow_SecServer"
      priority                   = 410
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [7083]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }

     In_stagingserver = {
      name                       = "In_Allow_StagingServer"
      priority                   = 420
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [7077]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
        Out_https = {
      name                       = "Out_Allow_HTTPS"
      priority                   = 350
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    Out_bdservice = {
      name                       = "Out_Allow_BitdefenderService"
      priority                   = 400
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_ranges    = [443,53,389,636,3268,3269,7074,7075,27017,123,7077,8443,7083,7081,22,4369,5672]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "Internet"
    }
        Out_bdinternal = {
      name                       = "Out_Allow_BitdefenderServiceInternal"
      priority                   = 410
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_ranges    = [7074,7077,8443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
      Out_SMTP = {
      name                       = "Out_Allow_SMTP_587"
      priority                   = 420
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [587]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
   }
  
        ########################----sonarqube custom------------------######################

   custom_sonarqube_nsgrules = {
     In_https = {
      name                       = "In_Allow_HTTPS"
      priority                   = 350
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443,8443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
        Out_https = {
      name                       = "Out_Allow_HTTPS"
      priority                   = 350
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    Out_9090 = {
      name                       = "Out_Allow_9090"
      priority                   = 400
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [9090]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
      Out_SMTP = {
      name                       = "Out_Allow_SMTP_587"
      priority                   = 420
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [587]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
   }

         ########################----selenium custom------------------######################

   custom_selenium_nsgrules = {
     In_https = {
      name                       = "In_Allow_HTTPS"
      priority                   = 350
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
        In_selenium = {
      name                       = "In_Allow_Selenium"
      priority                   = 400
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [4444,"5550-5555"]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
        Out_https = {
      name                       = "Out_Allow_HTTPS"
      priority                   = 350
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    Out_selenium = {
      name                       = "Out_Allow_Selenium"
      priority                   = 400
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [4444,"5550-5555"]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
      Out_SMTP = {
      name                       = "Out_Allow_SMTP_587"
      priority                   = 420
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [587]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
   }

   ########################----semmle custom------------------######################

   custom_semmle_nsgrules = {
     RDP = {
      name                       = "In_Allow_RDP"
      priority                   = 301
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [3389]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
     In_https = {
      name                       = "In_Allow_HTTPS"
      priority                   = 350
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    Out_SMTP = {
      name                       = "Out_Allow_SMTP"
      priority                   = 410
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [587]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    Out_https = {
      name                       = "Out_Allow_HTTPS"
      priority                   = 350
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
   }
         ########################----rediscache custom------------------######################

   custom_rediscache_nsgrules = {
     In_https = {
      name                       = "In_Allow_HTTPS"
      priority                   = 350
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443,8443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
         In_redisendpoint = {
      name                       = "In_Allow_ClientEndpoints"
      priority                   = 400
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [6380]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
         In_commvnet = {
      name                       = "In_Allow_ClientCommunicationWithinVnet"
      priority                   = 410
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [6380,"13000-13999","15000-15999"]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
         In_rediscommvnet = {
      name                       = "In_Allow_InternalRedisCommunication"
      priority                   = 420
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [8443,"10221-10231",20226]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
        Out_https = {
      name                       = "Out_Allow_HTTPS"
      priority                   = 350
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    }
    Out_DNS = {
      name                       = "Out_Allow_DNS"
      priority                   = 400
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_ranges    = [53]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "*"
    }
      Out_redis = {
      name                       = "Out_Allow_RedisPortsWithinSubnet"
      priority                   = 420
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [6380,8443,"10221-10231",20226,"13000-13999","15000-15999"]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
   }

         ########################----asnible custom------------------######################

   custom_ansible_nsgrules = {
     In_https = {
      name                       = "In_Allow_HTTPS"
      priority                   = 350
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443,8443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
        Out_https = {
      name                       = "Out_Allow_HTTPS"
      priority                   = 350
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [443]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
    Out_RDP = {
      name                       = "Out_Allow_InternalComm"
      priority                   = 400
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [3389,22]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
      Out_SMTP = {
      name                       = "Out_Allow_SMTP_587"
      priority                   = 420
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = [587]
      source_address_prefix      = "VirtualNetwork"
      destination_address_prefix = "VirtualNetwork"
    }
   }
 }