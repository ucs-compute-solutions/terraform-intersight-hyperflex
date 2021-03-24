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

variable "cluster_moid" {
  type = string
  description = "The moid of the cluster for this policy to be associated with"
}

variable "hxdp_version" {
  type = string
  description = "The version of Cisco HyperFlex to install in the form of 4.x(xx)"
}

variable "firmware_version" {
  type = string
  description = "The UCSM firmware package version to apply to the servers in the form of 4.x(xx)"
}