variable "cluster_name" {
  type = string
  description = "This is the name of the HyperFlex cluster in Intersight and vCenter"
}

variable "cluster_moid" {
  type = string
  description = "The moid of the cluster for this policy to be associated with"
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

variable "uplink_speed" {
  type = string
  description = "The speed of the uplinks of an HX Edge cluster. Valid options for this are 1G or 10G."
}

variable "mac_prefix" {
  type = string
  description = "The MAC address prefix in the form of 00:25:B5:XX"
}

variable "jumbo_frame" {
  type = bool
  description = "Enable jumbo frames for HX storage traffic"
  default = "true"
}

variable "kvm_ip_start" {
  type = string
  description = "UCSM management IP address range start"
}

variable "kvm_ip_end" {
  type = string
  description = "UCSM management IP address range end"
}

variable "kvm_netmask" {
  type = string
  description = "UCSM management IP subnet mask"
}

variable "kvm_gateway" {
  type = string
  description = "UCSM management default gateway"
}

variable "mgmt_vlan_name" {
  type = string
  description = "ESXi management VLAN name"
}

variable "mgmt_vlan_id" {
  type = number
  description = "ESXi management VLAN ID"
}

variable "vmotion_vlan_name" {
  type = string
  description = "VMotion VLAN name"
}

variable "vmotion_vlan_id" {
  description = "VMotion VLAN ID"
}

variable "vm_vlans" {
  type = list
  description = "Guest VM VLAN names and IDs"
}