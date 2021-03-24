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

variable "auto_support_enable" {
  type = bool
  description = "Set to true or false to enable auto support email settings"
}

variable "auto_support_recipient" {
  type = string
  description = "email address for auto support alerts"
}