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

variable "disk_cleanup" {
  type = bool
  description = "Enable or bypass cleanup of the existing disks"
  default = "false"
}

variable "vdi_opt" {
  type = bool
  description = "Enable VDI optimization"
  default = "false"
}

variable "laz_config" {
  type = bool
  description = "Enable Logical Availability Zones"
  default = "false"
}