# API access
api_key = ""
api_key_file = "SecretKey.txt"
api_endpoint = "https://www.intersight.com"

# Hyperflex Cluster
intersight_organization_name = "Terraform-testing"
cluster_name = "Edge2Node"
disk_cleanup = "true"
vdi_opt = "false"
laz_config = "false"
#cluster_action = "Validate"

# Management Platform - for standard clusters enter false, for HX Edge clusters enter true
edge_cluster = "true"

# Network Policies
jumbo_frame = "false"

# Uplink speed, only needed for HX Edge clusters. Valid options are 1G or 10G.
uplink_speed = "10G"

# Replication Factor
replication = "2"

# HX Management IP
mgmt_vlan_name = ""
mgmt_vlan_id = "133"
hx_mgmt_ip = "10.29.133.214"
hx_ip_start = "10.29.133.215"
hx_ip_end = "10.29.133.216"
hx_netmask = "255.255.255.0"
hx_gateway = "10.29.133.1"

# MAC prefix
mac_prefix = "00:25:B5:26"

# Storage VLAN
storage_vlan_name = ""
storage_vlan_id = "52"

# HXDP Version
hxdp_version = "4.5(1a)"

# UCSM Firmware Version
firmware_version = ""

# HX password
hx_password = "CIsco123!!"

# ESXi admin account
esx_admin = "root"

# ESXi admin password
esx_password = "CIsco123!!"

# ESXi Management IP
node_prefix = "hxaf240m5sd"
mgmt_ip_start = "10.29.133.219"
mgmt_ip_end = "10.29.133.220"
mgmt_netmask = "255.255.255.0"
mgmt_gateway = "10.29.133.1"

# Time
timezone = "America/Los_Angeles"
ntp = ["ntp1.hx.lab.cisco.com", "ntp2.hx.lab.cisco.com"]

# DNS
dns_domain = "hx.lab.cisco.com"
dns = ["10.29.133.110"]

# UCSM KVM IP
kvm_ip_start = ""
kvm_ip_end = ""
kvm_netmask = ""
kvm_gateway = ""

# VCenter
vcenter_hostname = "vcenter.hx.lab.cisco.com"
vcenter_username = "administrator@vsphere.local"
vcenter_password = "!Q2w3e4r"
vcenter_datacenter = "Datacenter" 

# VMotion
vmotion_vlan_name = ""
vmotion_vlan_id = ""

# Guest VM networks
vm_vlans = []

# FC Additional vHBAs
additional_vHBAs = "false"
fc_vsan_a_name = ""
fc_vsan_a_id = ""
fc_vsan_b_name = ""
fc_vsan_b_id = ""
wwxn_prefix = ""
fc_wwxn_range_start = ""
fc_wwxn_range_end = ""

# iSCSI Additional vNICs
additional_vNICs = "false"
iscsi_vlan_a_name = ""
iscsi_vlan_a_id = ""
iscsi_vlan_b_name = ""
iscsi_vlan_b_id = ""

# Auto Support
auto_support_enable = "false"
auto_support_recipient = ""

# Proxy Server
proxy_enable = "false"
proxy_hostname = ""
proxy_port = ""
proxy_username = ""
proxy_password = ""

server_names = {
  "hxaf240m5sd-01-cimc" = { hostname = "hxaf240m5sd-01", esx_ip = "10.29.133.219", hx_ip = "10.29.133.215" },
  "hxaf240m5sd-02-cimc" = { hostname = "hxaf240m5sd-02", esx_ip = "10.29.133.220", hx_ip = "10.29.133.216" }
  }