variable "cluster_name" {
  type = string
  description = "This is the name of the HyperFlex cluster in Intersight and vCenter"
}

variable "intersight_organization_moid" {
  type = string
  description = "This is the moid of the Intersight organization where this policy or profile will be created within"
}

variable "edge_cluster" {
  type = bool
  description = "Set this variable to true when installing an HX Edge cluster, otherwise set to false. This variable defaults to false."
  default = "false"
}

# variable "cluster_action" {
#   type = string
#   description = "The action to take on the HX profile after all the configuration is set. Valid options for this script are Validate or Deploy "
# }

variable "replication" {
  type = number
  description = "The replication factor setting for the HX cluster"
  default = "3"
}

variable "hx_mgmt_ip" {
  type = string
  description = "The management IP address of the HyperFlex cluster"
}

variable "mac_prefix" {
  type = string
  description = "The MAC address prefix in the form of 00:25:B5:XX"
}

variable "wwxn_prefix" {
  type = string
  description = "The WWXN prefix in the form of 20:00:00:25:B5:XX"
}

variable "storage_vlan_name" {
  type = string
  description = "The name of the HX storage VLAN in the UCSM configuration"
}

variable "storage_vlan_id" {
  type = number
  description = "The VLAN ID of the HX storage VLAN"
}