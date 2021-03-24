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

variable "vcenter_hostname" {
  type = string
  description = "DNS name or IP address of the managing vCenter Server"
}

variable "vcenter_username" {
  type = string
  description = "Administrative user for logging into and managing vCenter"
}

variable "vcenter_password" {
  type = string
  description = "Administrative user password for accessing vCenter"
}

variable "vcenter_datacenter" {
  type = string
  description = "Name of the vCenter Datacenter object where the HX cluster will be placed"
}