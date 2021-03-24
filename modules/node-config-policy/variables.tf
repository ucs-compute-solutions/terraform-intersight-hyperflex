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

variable "node_prefix" {
  type = string
  description = "Prefix for the names of the nodes as assigned to ESXi"
}

variable "hx_ip_start" {
  type = string
  description = "HX controller IP address range start"
}

variable "hx_ip_end" {
  type = string
  description = "HX controller IP address range end"
}

variable "hx_netmask" {
  type = string
  description = "HX controller IP subnet mask"
}

variable "hx_gateway" {
  type = string
  description = "HX controller default gateway"
}

variable "mgmt_ip_start" {
  type = string
  description = "ESXi management IP address range start"
}

variable "mgmt_ip_end" {
  type = string
  description = "ESXi management IP address range end"
}

variable "mgmt_netmask" {
  type = string
  description = "ESXi management IP subnet mask"
}

variable "mgmt_gateway" {
  type = string
  description = "ESXi management default gateway"
}