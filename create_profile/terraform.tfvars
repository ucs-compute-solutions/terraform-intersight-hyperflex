# Modify the following example variables with valid settings for the HX cluster you wish to deploy

# API access
api_key = ""
api_key_file = "SecretKey.txt"
api_endpoint = "https://www.intersight.com"

# Hyperflex Cluster
cluster_name = "All-Flash"
disk_cleanup = "false"
vdi_opt = "false"
laz_config = "false"

# Management Platform, enter "FI" for standard or "EDGE" for Edge
management_platform = "FI"

# Network Policies
jumbo_frame = "true"

# Replication Factor
replication = "3"

# HX Management IP
mgmt_vlan_name = "hx-mgmt-133"
mgmt_vlan_id = "133"
hx_mgmt_ip = "10.29.133.237"
hx_ip_start = "10.29.133.238"
hx_ip_end = "10.29.133.241"
hx_netmask = "255.255.255.0"
hx_gateway = "10.29.133.1"

# MAC prefix
mac_prefix = "00:25:B5:7F"

# WWXN prefix
wwxn_prefix = "20:00:00:25:B5:7F"

# Storage VLAN
storage_vlan_name = "hx-storage-51"
storage_vlan_id = "51"

# HXDP Version
hxdp_version = "4.0(2d)"

# UCSM Firmware Version
firmware_version = "4.1(2a)"

# HX password
#hx_password = ""

# ESXi admin account
esx_admin = "root"

# ESXi admin password
#esx_password = ""

# ESXi Management IP
node_prefix = "hx220m5"
mgmt_ip_start = "10.29.133.246"
mgmt_ip_end = "10.29.133.249"
mgmt_netmask = "255.255.255.0"
mgmt_gateway = "10.29.133.1"

# Time
timezone = "America/Los_Angeles"
ntp = ["ntp1.company.com", "ntp2.company.com"]

# DNS
dns_domain = "us.company.com"
dns = ["10.29.133.110"]

# UCSM KVM IP
kvm_ip_start = "10.29.133.242"
kvm_ip_end = "10.29.133.245"
kvm_netmask = "255.255.255.0"
kvm_gateway = "10.29.133.1"

# VCenter
vcenter_hostname = "vcenter.us.company.com"
vcenter_username = "administrator@vsphere.local"
#vcenter_password = ""
vcenter_datacenter = "Datacenter" 

# VMotion
vmotion_vlan_name = "vmotion-200"
vmotion_vlan_id = "200"

# Guest VM networks
vm_vlans = [
  {
    name = "vm-network-100"
    vlan_id = "100"
    additional_properties = null
    class_id = "hyperflex.NamedVlan"
    object_type = "hyperflex.NamedVlan"
  },
  {
    name = "vm-network-101"
    vlan_id = "101"
    additional_properties = null
    class_id = "hyperflex.NamedVlan"
    object_type = "hyperflex.NamedVlan"
  },
]

# iSCSI Additional vNICs
additional_vNICs = "true"
iscsi_vlan_a_name = "iscsi-110"
iscsi_vlan_a_id = "110"
iscsi_vlan_b_name = "iscsi-111"
iscsi_vlan_b_id = "111"

# FC Additional vHBAs
additional_vHBAs = "true"
fc_vsan_a_name = "vsan-10"
fc_vsan_a_id = "10"
fc_vsan_b_name = "vsan-20"
fc_vsan_b_id = "20"
fc_wwxn_range_start = "20:00:00:25:B5:7F"
fc_wwxn_range_end = "20:00:00:25:B5:7F"

# Auto Support
auto_support_enable = "true"
auto_support_recipient = "support@company.com"

# Proxy Server
proxy_enable = "true"
proxy_hostname = "proxy.us.company.com"
proxy_port = "80"

# Server Names
server_names = [
  {
    name = "SJC2-151-K27-6332-9",
    hostname = "hx220m5-01"
  },
  {
    name = "SJC2-151-K27-6332-10",
    hostname = "hx220m5-02"
  },
  {
    name = "SJC2-151-K27-6332-11",
    hostname = "hx220m5-03"
  },
  {
    name = "SJC2-151-K27-6332-12",
    hostname = "hx220m5-04"
  }
]