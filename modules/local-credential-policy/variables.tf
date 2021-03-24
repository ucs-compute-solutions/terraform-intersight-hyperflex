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

variable "factory_password" {
  type = bool
  description = "Does the ESXi hypervisor installed on the HX series nodes use the factory applied password?"
  default = "true"
}

variable "hx_password" {
  type = string
  description = "The password to set for the HX controller VMs and cluster management"
}

variable "esx_admin" {
  type = string
  description = "The administrative account to use for the ESXi hypervisors"
  default = "root"
}

variable "esx_password" {
  type = string
  description = "the password to set for the ESXi hypervisors' admin account"
}