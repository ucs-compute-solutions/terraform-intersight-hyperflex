# Server and Organization names
variable "cluster_name" {
  type = string
  description = "This is the name of the HyperFlex cluster in Intersight and vCenter"
}

variable "intersight_organization_moid" {
  type = string
  description = "This is the moid of the Intersight organization where this policy or profile will be created within"
}

variable "cluster_moid" {
  type = string
  description = "The moid of the cluster for this policy to be associated with"
}

variable "server_name" {
  type = string
  description = "The hostname for the ESXi hypervisor of the node being associated"
}

variable "intersight_name" { 
  type = string
  description = "The inventory name in Intersight of the node being associated"
}

variable "esx_ip" {
  type = string
  description = "The IP address for the ESXi hypervisor of the node being associated"
}

variable "hx_ip" {
  type = string
  description = "The IP address for the HX controller VM of the node being associated"
} 
