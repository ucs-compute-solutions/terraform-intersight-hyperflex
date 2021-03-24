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

variable "proxy_enable" {
  type = bool
  description = "Set to true or false to use a proxy server for internet access"
}

variable "proxy_hostname" {
  type = string
  description = "Proxy server DNS hostname"
}

variable "proxy_port" {
  type = number
  description = "Proxy server port number"
}

variable "proxy_username" {
  type = string
  description = "Proxy server username"
}

variable "proxy_password" {
  type = string
  description = "Proxy server password"
}