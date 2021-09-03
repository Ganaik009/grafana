# variable "resource_group_name" {
#   description = "The name of the resource group"
# }

# variable "resource_group_location" {
#   description = "The location in which the resource group will be created"
# }

variable "utilities_rg_name" {
  description = "The name of the resource group"
}

variable "location" {
  description = "The name of the resource group"
}
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
  type        = string
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
