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

variable "additional_vHBAs" {
  type = bool
  description = "Set to true or false to create additional vHBAs in the node profiles for external FC"
}

variable "fc_vsan_a_name" {
  type = string
  description = "FC VSAN A name"
}

variable "fc_vsan_a_id" {
  type = number
  description = "FC VSAN A ID"
}

variable "fc_vsan_b_name" {
  type = string
  description = "FC VSAN B name"
}

variable "fc_vsan_b_id" {
  type = number
  description = "FC VSAN B ID"
}

variable "fc_wwxn_range_start" {
  type = string
  description = "FC WWXN range starting value"
}

variable "fc_wwxn_range_end" {
  type = string
  description = "FC WWXN range ending value"
}
