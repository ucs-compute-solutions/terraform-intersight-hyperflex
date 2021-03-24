# Intersight Provider Information 
terraform {
  required_version = ">= 0.14.0"
  required_providers {
    intersight = {
      source = "CiscoDevNet/intersight"
      version = ">= 1.0.2"
    }
  }
}

provider "intersight" {
  apikey = var.api_key
  secretkey = var.api_key_file
  endpoint = var.api_endpoint
}

# Retrieve the Intersight organization moid
module intersight-organization {
  source = "./modules/intersight-organization"
  intersight_organization_name = var.intersight_organization_name
}

# Create the standard HX cluster profile
module cluster-profile {
  source = "./modules/cluster-profile"
  cluster_name = var.cluster_name
  intersight_organization_moid = module.intersight-organization.organization_moid
  edge_cluster = var.edge_cluster
#  cluster_action = var.cluster_action
  replication = var.replication
  hx_mgmt_ip = var.hx_mgmt_ip
  mac_prefix = var.mac_prefix
  wwxn_prefix = var.wwxn_prefix
  storage_vlan_name = var.storage_vlan_name
  storage_vlan_id = var.storage_vlan_id
  depends_on = [module.intersight-organization]
}

# Retrieve the HX cluster profile moid
module cluster-moid {
  source = "./modules/cluster-moid"
  cluster_name = var.cluster_name
  depends_on = [module.cluster-profile]
}

# Create the HX software version policy 
module software-version-policy {
  source = "./modules/software-version-policy"
  cluster_name = var.cluster_name
  cluster_moid = module.cluster-moid.cluster_moid
  intersight_organization_moid = module.intersight-organization.organization_moid
  edge_cluster = var.edge_cluster
  hxdp_version = var.hxdp_version
  firmware_version = var.firmware_version
  depends_on = [module.cluster-moid]
}

# Create the HX local credential policy
module local-credential-policy {
  source = "./modules/local-credential-policy"
  cluster_name = var.cluster_name
  cluster_moid = module.cluster-moid.cluster_moid
  intersight_organization_moid = module.intersight-organization.organization_moid
  factory_password = var.factory_password
  hx_password = var.hx_password
  esx_admin = var.esx_admin
  esx_password = var.esx_password
  depends_on = [module.cluster-moid]
}

# Create the HX system config policy
module system-config-policy {
  source = "./modules/system-config-policy"
  cluster_name = var.cluster_name
  cluster_moid = module.cluster-moid.cluster_moid
  intersight_organization_moid = module.intersight-organization.organization_moid
  timezone = var.timezone
  dns_domain = var.dns_domain
  dns = var.dns
  ntp = var.ntp
  depends_on = [module.cluster-moid]
}

# Create the HX vCenter policy
module vcenter-policy {
  source = "./modules/vcenter-policy"
  cluster_name = var.cluster_name
  cluster_moid = module.cluster-moid.cluster_moid
  intersight_organization_moid = module.intersight-organization.organization_moid
  vcenter_hostname = var.vcenter_hostname
  vcenter_username = var.vcenter_username
  vcenter_password = var.vcenter_password
  vcenter_datacenter = var.vcenter_datacenter
  depends_on = [module.cluster-moid]
}

# Create the HX node config policy
module node-config-policy {
  source = "./modules/node-config-policy"
  cluster_name = var.cluster_name
  cluster_moid = module.cluster-moid.cluster_moid
  intersight_organization_moid = module.intersight-organization.organization_moid
  node_prefix = var.node_prefix
  hx_ip_start = var.hx_ip_start 
  hx_ip_end = var.hx_ip_end
  hx_netmask = var.hx_netmask
  hx_gateway = var.hx_gateway
  mgmt_ip_start = var.mgmt_ip_start
  mgmt_ip_end = var.mgmt_ip_end
  mgmt_netmask = var.mgmt_netmask
  mgmt_gateway = var.mgmt_gateway
  depends_on = [module.cluster-moid]
}

# Create the HX cluster network policy
module cluster-network-policy {
  source = "./modules/cluster-network-policy"
  cluster_name = var.cluster_name
  cluster_moid = module.cluster-moid.cluster_moid
  intersight_organization_moid = module.intersight-organization.organization_moid
  edge_cluster = var.edge_cluster
  uplink_speed = var.uplink_speed
  jumbo_frame = var.jumbo_frame
  kvm_ip_start = var.kvm_ip_start
  kvm_ip_end = var.kvm_ip_end
  kvm_netmask = var.kvm_netmask
  kvm_gateway = var.kvm_gateway
  mac_prefix = var.mac_prefix
  mgmt_vlan_name = var.mgmt_vlan_name
  mgmt_vlan_id = var.mgmt_vlan_id
  vmotion_vlan_name = var.vmotion_vlan_name
  vmotion_vlan_id = var.vmotion_vlan_id
  vm_vlans = var.vm_vlans
  depends_on = [module.cluster-moid]
}

# Create the HX cluster storage policy
module cluster-storage-policy {
  source = "./modules/cluster-storage-policy"
  cluster_name = var.cluster_name
  cluster_moid = module.cluster-moid.cluster_moid
  intersight_organization_moid = module.intersight-organization.organization_moid
  edge_cluster = var.edge_cluster
  disk_cleanup = var.disk_cleanup
  vdi_opt = var.vdi_opt
  laz_config = var.laz_config
  depends_on = [module.cluster-moid]
} 

# Create an external FC storage policy if var.additional_vHBAs is true 
module ext-fc-storage-policy {
  source = "./modules/ext-fc-storage-policy"
  cluster_name = var.cluster_name
  cluster_moid = module.cluster-moid.cluster_moid
  intersight_organization_moid = module.intersight-organization.organization_moid
  edge_cluster = var.edge_cluster
  count = var.additional_vHBAs ? 1 : 0
  additional_vHBAs = var.additional_vHBAs
  fc_vsan_a_name = var.fc_vsan_a_name
  fc_vsan_a_id = var.fc_vsan_a_id
  fc_vsan_b_name = var.fc_vsan_b_name
  fc_vsan_b_id = var.fc_vsan_b_id
  fc_wwxn_range_start = var.fc_wwxn_range_start
  fc_wwxn_range_end = var.fc_wwxn_range_end
  depends_on = [module.cluster-moid]
}

# Create an external iSCSI storage policy if var.additional_vNICs is true
module ext-iscsi-storage-policy {
  source = "./modules/ext-iscsi-storage-policy"
  cluster_name = var.cluster_name
  cluster_moid = module.cluster-moid.cluster_moid
  intersight_organization_moid = module.intersight-organization.organization_moid
  edge_cluster = var.edge_cluster
  count = var.additional_vNICs ? 1 : 0
  additional_vNICs = var.additional_vNICs
  iscsi_vlan_a_name = var.iscsi_vlan_a_name
  iscsi_vlan_a_id = var.iscsi_vlan_a_id
  iscsi_vlan_b_name = var.iscsi_vlan_b_name
  iscsi_vlan_b_id = var.iscsi_vlan_b_id
  depends_on = [module.cluster-moid]
}

# Create an HX auto support policy if var.auto_support_enable is true
module auto-support-policy {
  source = "./modules/auto-support-policy"
  cluster_name = var.cluster_name
  cluster_moid = module.cluster-moid.cluster_moid
  intersight_organization_moid = module.intersight-organization.organization_moid
  count = var.auto_support_enable ? 1 : 0
  auto_support_enable = var.auto_support_enable
  auto_support_recipient = var.auto_support_recipient
  depends_on = [module.cluster-moid]
}

# Create an HX proxy setting policy if var.proxy_enable is true
module proxy-policy {
  source = "./modules/proxy-policy"
  cluster_name = var.cluster_name
  cluster_moid = module.cluster-moid.cluster_moid
  intersight_organization_moid = module.intersight-organization.organization_moid
  count = var.proxy_enable ? 1 : 0
  proxy_enable = var.proxy_enable
  proxy_hostname = var.proxy_hostname
  proxy_username = var.proxy_username
  proxy_password = var.proxy_password
  proxy_port = var.proxy_port
  depends_on = [module.cluster-moid]
}

# Create an HX node profile for each server listed in var.server_names
module node-profile {
  source = "./modules/node-profile"
  for_each = var.server_names
  cluster_name = var.cluster_name
  cluster_moid = module.cluster-moid.cluster_moid
  intersight_organization_moid = module.intersight-organization.organization_moid
  server_name = each.value.hostname
  intersight_name = each.key
  esx_ip = each.value.esx_ip
  hx_ip = each.value.hx_ip
  depends_on = [module.node-config-policy]
} 
