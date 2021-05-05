variable "api_key" {
  type = string
  description = "Enter the API key string for access to the Intersight API"
}

variable "api_key_file" {
  type = string
  description = "Enter the path to the API key file downloaded from Cisco Intersight for API access"
}

variable "api_endpoint" {
  type = string
  description = "Enter the URL for the Cisco Intersight API"
  default = "https://www.intersight.com"
}

variable "intersight_organization_name" {
  type = string
  description = "The name of the Intersight organization where the HX cluster profile and policies will be created in. The organization must also contain the FIs and servers to be deployed as part of this cluster"
}

variable "cluster_name" {
  type = string
  description = "This is the name of the HyperFlex cluster in Intersight and vCenter"
}

# variable "cluster_action" {
#   type = string
#   description = "The action to take on the HX profile after all the configuration is set. Valid options for this script are Validate or Deploy."
# }

variable "edge_cluster" {
  type = bool
  description = "Set this variable to true when installing an HX Edge cluster, otherwise set to false. This variable defaults to false."
  default = "false"
}

variable "replication" {
  type = number
  description = "The replication factor setting for the HX cluster"
  default = "3"
}

variable "uplink_speed" {
  type = string
  description = "The speed of the uplinks of an HX Edge cluster. Valid options for this are 1G or 10G."
}

variable "hx_mgmt_ip" {
  type = string
  description = "The management IP address of the HyperFlex cluster"
}

variable "mac_prefix" {
  type = string
  description = "The MAC address prefix in the form of 00:25:B5:XX"
}

variable "storage_vlan_name" {
  type = string
  description = "The name of the HX storage VLAN in the UCSM configuration"
}

variable "storage_vlan_id" {
  type = number
  description = "The VLAN ID of the HX storage VLAN"
}

variable "hxdp_version" {
  type = string
  description = "The version of Cisco HyperFlex to install in the form of 4.x(xx)"
}

variable "firmware_version" {
  type = string
  description = "The UCSM firmware package version to apply to the servers in the form of 4.x(xx)"
}

variable "factory_password" {
  type = bool
  description = "Does the ESXi hypervisor installed on the HX series nodes use the factory applied password?"
  default = "true"
}

variable "hx_password" {
  type = string
  sensitive = true
  description = "The password to set for the HX controller VMs and cluster management"
}

variable "esx_admin" {
  type = string
  description = "The administrative account to use for the ESXi hypervisors"
  default = "root"
}

variable "esx_password" {
  type = string
  sensitive = true
  description = "the password to set for the ESXi hypervisors' admin account"
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

variable "node_prefix" {
  type = string
  description = "Prefix for the names of the nodes as assigned to ESXi"
}

variable "hx_ip_start" {
  type = string
  description = "HX controller IP address range start"
}

variable "hx_ip_end" {
  type = string
  description = "HX controller IP address range end"
}

variable "hx_netmask" {
  type = string
  description = "HX controller IP subnet mask"
}

variable "hx_gateway" {
  type = string
  description = "HX controller default gateway"
}

variable "mgmt_ip_start" {
  type = string
  description = "ESXi management IP address range start"
}

variable "mgmt_ip_end" {
  type = string
  description = "ESXi management IP address range end"
}

variable "mgmt_netmask" {
  type = string
  description = "ESXi management IP subnet mask"
}

variable "mgmt_gateway" {
  type = string
  description = "ESXi management default gateway"
}

variable "jumbo_frame" {
  type = bool
  description = "Enable jumbo frames for HX storage traffic"
  default = "true"
}

variable "kvm_ip_start" {
  type = string
  description = "UCSM management IP address range start"
}

variable "kvm_ip_end" {
  type = string
  description = "UCSM management IP address range end"
}

variable "kvm_netmask" {
  type = string
  description = "UCSM management IP subnet mask"
}

variable "kvm_gateway" {
  type = string
  description = "UCSM management default gateway"
}

variable "mgmt_vlan_name" {
  type = string
  description = "ESXi management VLAN name"
}

variable "mgmt_vlan_id" {
  type = number
  description = "ESXi management VLAN ID"
}

variable "vmotion_vlan_name" {
  type = string
  description = "VMotion VLAN name"
}

variable "vmotion_vlan_id" {
  description = "VMotion VLAN ID"
}

variable "vm_vlans" {
  type = list
  description = "Guest VM VLAN names and IDs"
}

variable "server_names" {
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
  description = "iSCSI VLAN A ID"
}

variable "iscsi_vlan_b_name" {
  type = string
  description = "iSCSI VLAN B name"
}

variable "iscsi_vlan_b_id" {
  description = "iSCSI VLAN B ID"
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
  description = "FC VSAN A ID"
}

variable "fc_vsan_b_name" {
  type = string
  description = "FC VSAN B name"
}

variable "fc_vsan_b_id" {
  description = "FC VSAN B ID"
}

variable "wwxn_prefix" {
  type = string
  description = "The WWXN prefix in the form of 20:00:00:25:B5:XX"
}

variable "fc_wwxn_range_start" {
  type = string
  description = "FC WWXN range starting value"
}

variable "fc_wwxn_range_end" {
  type = string
  description = "FC WWXN range ending value"
}

variable "auto_support_enable" {
  type = bool
  description = "Set to true or false to enable auto support email settings"
}

variable "auto_support_recipient" {
  type = string
  description = "email address for auto support alerts"
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
  description = "Proxy server port number"
}

variable "proxy_username" {
  type = string
  description = "Proxy server username"
}

variable "proxy_password" {
  type = string
  sensitive = true
  description = "Proxy server password"
}