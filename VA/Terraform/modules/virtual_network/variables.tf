

variable "network_rg_name" {
  type        = string
  description = "The name of the Network resource group"
}

variable "location" {
  type        = string
  description = "The location in which the Network resource group will be created"
}

variable "network_name" {
  type        = string
  description = "Virtual Network Name"
}

variable "network_address_space" {
  description = "The address space used by the network "
}
#Subnets

# variable "subnet_address_prefixes" {
#   description = "List of address prefixes for the subnets"
#   type        = list
# }

# variable "subnet_address_names" {
#   description = "List of names for the subnets"
#   #type        = list
# }