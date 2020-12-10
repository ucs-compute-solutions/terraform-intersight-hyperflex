# Modify the following example variables with valid settings for the HX cluster you wish to deploy

# API access
api_key = ""
api_key_file = "SecretKey.txt"
api_endpoint = "https://www.intersight.com"

# Hyperflex Cluster
cluster_name = "Chicago-Edge"
disk_cleanup = "false"
vdi_opt = "false"

# Management Platform, enter "FI" for standard or "EDGE" for Edge
management_platform = "Edge"

# Network Policies
jumbo_frame = "true"
uplink_speed = "10G"

# HX Management IP
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
storage_vlan_id = "51"

# HXDP Version
hxdp_version = "4.0(2d)"

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
timezone = "America/Chicago"
ntp = ["ntp1.company.com", "ntp2.company.com"]

# DNS
dns_domain = "us.company.com"
dns = ["10.29.133.110"]

# VCenter
vcenter_hostname = "vcenter.us.company.com"
vcenter_username = "administrator@vsphere.local"
#vcenter_password = ""
vcenter_datacenter = "Datacenter" 

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