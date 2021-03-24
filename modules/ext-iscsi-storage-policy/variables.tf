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

variable "additional_vNICs" {
  type = bool
  description = "Set to true or false to create additional vNICs in the node profiles for external iSCSI"
}

variable "iscsi_vlan_a_name" {
  type = string
  description = "iSCSI VLAN A name"
}

variable "iscsi_vlan_a_id" {
  type = number
  description = "iSCSI VLAN A ID"
}

variable "iscsi_vlan_b_name" {
  type = string
  description = "iSCSI VLAN B name"
}

variable "iscsi_vlan_b_id" {
  type = number
  description = "iSCSI VLAN B ID"
}