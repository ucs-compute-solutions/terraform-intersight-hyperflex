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

variable "timezone" {
  type = string
  description = "The timezone of the HyperFlex system clock in standard region/location format"
}

variable "dns_domain" {
  type = string
  description = "The base DNS domain name for the nodes in the HX cluster"
}

variable "dns" {
  type = list
  description = "The DNS servers used for FQDN resolution"
}

variable "ntp" {
  type = list
  description = "The NTP servers used for time synchronization"
}