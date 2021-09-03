# provider "azurerm" {
#     version = "~>2.0"
#     environment = "usgovernment"
#     features {}
# }

# Create Log Analytic

resource "azurerm_log_analytics_workspace" "loganalytics" {
  name                        = var.la_name
  location                    = var.location
  resource_group_name         = var.utilities_rg_name
  sku                         = var.la_sku
  retention_in_days           = var.la_retention_in_days
  #internet_ingestion_enabled = false
  #internet_query_enabled     = false
  #tags                        = var.tags
}
resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog01" {
  name                = "WinEventLog01"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Application"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog02" {
  name                = "WinEventLog02"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Microsoft-Windows-Winlogon/Operational"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog03" {
  name                = "WinEventLog03"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Microsoft-Windows-DataIntegrityScan/Admin"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog04" {
  name                = "WinEventLog04"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Microsoft-Windows-EventCollector/Operational"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog05" {
  name                = "WinEventLog05"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Microsoft-Windows-RemoteApp and Desktop Connections/Admin"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog06" {
  name                = "WinEventLog06"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Microsoft-Windows-RemoteApp and Desktop Connections/Operational"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog07" {
  name                = "WinEventLog07"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "WinEventLog06"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog08" {
  name                = "WinEventLog08"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Microsoft-Windows-RemoteDesktopServices-RdpCoreTS/Operational"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog09" {
  name                = "WinEventLog09"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Microsoft-Windows-RestartManager/Operational"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog10" {
  name                = "WinEventLog10"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Microsoft-Windows-Security-Audit-Configuration-Client/Operational"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog11" {
  name                = "WinEventLog11"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Microsoft-Windows-FileServices-ServerManager-EventProvider/Operational"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog12" {
  name                = "WinEventLog12"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Microsoft-Windows-Security-Netlogon/Operational"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog13" {
  name                = "WinEventLog13"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Microsoft-Windows-Shell-AuthUI-LogonUI/Diagnostic"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog14" {
  name                = "WinEventLog14"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Microsoft-Windows-Shell-AuthUI-Shutdown/Diagnostic"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog15" {
  name                = "WinEventLog15"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Microsoft-Windows-TerminalServices-RDPClient/Operational"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog16" {
  name                = "WinEventLog16"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Microsoft-Windows-TerminalServices-RemoteConnectionManager/Operational"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog17" {
  name                = "WinEventLog17"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Microsoft-Windows-Winlogon/Diagnostic"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog18" {
  name                = "WinEventLog18"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Microsoft-Windows-HttpService/Log"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog19" {
  name                = "WinEventLog19"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Operations Manager"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog20" {
  name                = "WinEventLog20"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "Setup"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog21" {
  name                = "WinEventLog21"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "System"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_event" "WinEventLog22" {
  name                = "WinEventLog22"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  event_log_name      = "SystemEventsBroker"
  event_types         = ["error", "warning", "information"]
}

resource "azurerm_log_analytics_datasource_windows_performance_counter" "WinPerfCounter01" {
  name                = "WindowsPerfMemoryAvailableBytes"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  object_name         = "Memory"
  instance_name       = "*"
  counter_name        = "Available MBytes"
  interval_seconds    = 10
}

resource "azurerm_log_analytics_datasource_windows_performance_counter" "WinPerfCounter02" {
  name                = "WindowsPerfMemoryPercentageBytes"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  object_name         = "Memory"
  instance_name       = "*"
  counter_name        = "% Used Memory"
  interval_seconds    = 10
}

resource "azurerm_log_analytics_datasource_windows_performance_counter" "WinPerfCounter03" {
  name                = "WindowsPerfProcessorPercentage"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  object_name         = "Processor"
  instance_name       = "_Total"
  counter_name        = "% Processor Time"
  interval_seconds    = 10
}

resource "azurerm_log_analytics_datasource_windows_performance_counter" "WinPerfCounter04" {
  name                = "WindowsPerfDiskFreeSpacePercentage"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  object_name         = "LogicalDisk"
  instance_name       = "*"
  counter_name        = "% Free Space"
  interval_seconds    = 10
}

resource "azurerm_log_analytics_datasource_windows_performance_counter" "WinPerfCounter05" {
  name                = "WindowsPerfDiskUsedSpacePercentage"
  resource_group_name = var.utilities_rg_name
  workspace_name      = azurerm_log_analytics_workspace.loganalytics.name
  object_name         = "LogicalDisk"
  instance_name       = "*"
  counter_name        = "% Used Space"
  interval_seconds    = 10
}

resource "azurerm_log_analytics_solution" "Solution1" {
  depends_on            = [azurerm_log_analytics_workspace.loganalytics]
  solution_name         = "ContainerInsights"
  location              = var.location
  resource_group_name   = var.utilities_rg_name
  workspace_resource_id = azurerm_log_analytics_workspace.loganalytics.id
  workspace_name        = azurerm_log_analytics_workspace.loganalytics.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

resource "azurerm_log_analytics_solution" "Solution2" {
  solution_name         = "AzureActivity"
  location              = var.location
  resource_group_name   = var.utilities_rg_name
  workspace_resource_id = azurerm_log_analytics_workspace.loganalytics.id
  workspace_name        = azurerm_log_analytics_workspace.loganalytics.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AzureActivity"
  }
}

resource "azurerm_log_analytics_solution" "Solution3" {
  solution_name         = "VMInsights"
  location              = var.location
  resource_group_name   = var.utilities_rg_name
  workspace_resource_id = azurerm_log_analytics_workspace.loganalytics.id
  workspace_name        = azurerm_log_analytics_workspace.loganalytics.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/VMInsights"
  }
}

resource "azurerm_log_analytics_solution" "Solution4" {
  solution_name         = "Updates"
  location              = var.location
  resource_group_name   = var.utilities_rg_name
  workspace_resource_id = azurerm_log_analytics_workspace.loganalytics.id
  workspace_name        = azurerm_log_analytics_workspace.loganalytics.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/Updates"
  }
}

resource "azurerm_log_analytics_solution" "Solution5" {
  solution_name         = "SecurityCenterFree"
  location              = var.location
  resource_group_name   = var.utilities_rg_name
  workspace_resource_id = azurerm_log_analytics_workspace.loganalytics.id
  workspace_name        = azurerm_log_analytics_workspace.loganalytics.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/SecurityCenterFree"
  }
}

resource "azurerm_log_analytics_solution" "Solution6" {
  solution_name         = "Security"
  location              = var.location
  resource_group_name   = var.utilities_rg_name
  workspace_resource_id = azurerm_log_analytics_workspace.loganalytics.id
  workspace_name        = azurerm_log_analytics_workspace.loganalytics.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/Security"
  }
}

resource "azurerm_log_analytics_solution" "Solution7" {
  solution_name         = "ChangeTracking"
  location              = var.location
  resource_group_name   = var.utilities_rg_name
  workspace_resource_id = azurerm_log_analytics_workspace.loganalytics.id
  workspace_name        = azurerm_log_analytics_workspace.loganalytics.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ChangeTracking"
  }
}

resource "azurerm_log_analytics_solution" "Solution8" {
  solution_name         = "KeyVaultAnalytics"
  location              = var.location
  resource_group_name   = var.utilities_rg_name
  workspace_resource_id = azurerm_log_analytics_workspace.loganalytics.id
  workspace_name        = azurerm_log_analytics_workspace.loganalytics.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/KeyVaultAnalytics"
  }
}

resource "azurerm_log_analytics_solution" "Solution9" {
  solution_name         = "AntiMalware"
  location              = var.location
  resource_group_name   = var.utilities_rg_name
  workspace_resource_id = azurerm_log_analytics_workspace.loganalytics.id
  workspace_name        = azurerm_log_analytics_workspace.loganalytics.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/AntiMalware"
  }
}

resource "azurerm_log_analytics_solution" "Solution10" {
  solution_name         = "NetworkMonitoring"
  location              = var.location
  resource_group_name   = var.utilities_rg_name
  workspace_resource_id = azurerm_log_analytics_workspace.loganalytics.id
  workspace_name        = azurerm_log_analytics_workspace.loganalytics.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/NetworkMonitoring"
  }
}

# resource "azurerm_log_analytics_linked_storage_account" "diagnostic_storage1" {
#   data_source_type      = "customlogs"
#   resource_group_name   = azurerm_resource_group.example.name
#   workspace_resource_id = azurerm_log_analytics_workspace.example.id
#   storage_account_ids   = [azurerm_storage_account.example.id]
# }