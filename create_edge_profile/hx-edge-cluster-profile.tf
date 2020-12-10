# Create HX cluster profile
resource "intersight_hyperflex_cluster_profile" "cluster_profile" {
  name = var.cluster_name
  mgmt_platform = var.management_platform
  mgmt_ip_address = var.hx_mgmt_ip
  mac_address_prefix = var.mac_prefix
  wwxn_prefix = var.wwxn_prefix
  storage_data_vlan {
    vlan_id = var.storage_vlan_id
  }
}

# Create HX software version policy 
resource "intersight_hyperflex_software_version_policy" "software_version_policy" {
  name = "${var.cluster_name}-software-version-policy"
  hxdp_version = var.hxdp_version
  cluster_profiles {
    moid = intersight_hyperflex_cluster_profile.cluster_profile.moid
  }
  depends_on = [intersight_hyperflex_cluster_profile.cluster_profile]
}

# Create HX local credential policy
resource "intersight_hyperflex_local_credential_policy" "credential_policy" {
  name = "${var.cluster_name}-local-credential-policy"
  factory_hypervisor_password = var.factory_password
  hxdp_root_pwd = var.hx_password
  hypervisor_admin = var.esx_admin
  hypervisor_admin_pwd = var.esx_password
  cluster_profiles {
    moid = intersight_hyperflex_cluster_profile.cluster_profile.moid
  }
  depends_on = [intersight_hyperflex_cluster_profile.cluster_profile]
}

# Create HX system config policy
resource "intersight_hyperflex_sys_config_policy" "system_config_policy" {
  name = "${var.cluster_name}-sys-config-policy"
  timezone = var.timezone
  dns_domain_name = var.dns_domain
  dns_servers = var.dns
  ntp_servers = var.ntp
  cluster_profiles {
    moid = intersight_hyperflex_cluster_profile.cluster_profile.moid
  }
  depends_on = [intersight_hyperflex_cluster_profile.cluster_profile]
}

# Create HX vCenter policy
resource "intersight_hyperflex_vcenter_config_policy" "vcenter_policy" {
  name = "${var.cluster_name}-vcenter-config-policy"
  hostname = var.vcenter_hostname
  username = var.vcenter_username
  password = var.vcenter_password
  data_center = var.vcenter_datacenter
  cluster_profiles {
    moid = intersight_hyperflex_cluster_profile.cluster_profile.moid
  }
  depends_on = [intersight_hyperflex_cluster_profile.cluster_profile]
}

# Create HX cluster storage policy
resource "intersight_hyperflex_cluster_storage_policy" "cluster_storage_policy" {
  name = "${var.cluster_name}-cluster-storage-policy"
  disk_partition_cleanup = var.disk_cleanup
  vdi_optimization = var.vdi_opt
  cluster_profiles {
    moid = intersight_hyperflex_cluster_profile.cluster_profile.moid
  }
  depends_on = [intersight_hyperflex_cluster_profile.cluster_profile]
}

# Create HX node config policy
resource "intersight_hyperflex_node_config_policy" "node_config_policy" {
  name = "${var.cluster_name}-node-config-policy"
  node_name_prefix = var.node_prefix
  hxdp_ip_range {
    start_addr = var.hx_ip_start 
    end_addr = var.hx_ip_end
    netmask = var.hx_netmask
    gateway = var.hx_gateway
  }
  mgmt_ip_range {
    start_addr = var.mgmt_ip_start
    end_addr = var.mgmt_ip_end
    netmask = var.mgmt_netmask
    gateway = var.mgmt_gateway
  }
  cluster_profiles {
    moid = intersight_hyperflex_cluster_profile.cluster_profile.moid
  }
  depends_on = [intersight_hyperflex_cluster_profile.cluster_profile]
}

# Create HX cluster network policy
resource "intersight_hyperflex_cluster_network_policy" "cluster_network_policy" {
  name = "${var.cluster_name}-cluster-network-policy"
  jumbo_frame = var.jumbo_frame
  uplink_speed = var.uplink_speed
  mac_prefix_range {
    start_addr = var.mac_prefix
    end_addr = var.mac_prefix
  }
  mgmt_vlan {
    vlan_id = var.mgmt_vlan_id
  }
  cluster_profiles {
    moid = intersight_hyperflex_cluster_profile.cluster_profile.moid
  }
  depends_on = [intersight_hyperflex_cluster_profile.cluster_profile]
}

# Create external iSCSI storage policy if var.additional_vNICs is true
resource "intersight_hyperflex_ext_iscsi_storage_policy" "ext_iscsi_storage_policy" {
  count = var.additional_vNICs ? 1 : 0
  name = "${var.cluster_name}-ext-iscsi-storage-policy"
  admin_state = var.additional_vNICs
  exta_traffic {
    name = var.iscsi_vlan_a_name
    vlan_id = var.iscsi_vlan_a_id
  }
  extb_traffic {
    name = var.iscsi_vlan_b_name
    vlan_id = var.iscsi_vlan_b_id
  }
  cluster_profiles {
    moid = intersight_hyperflex_cluster_profile.cluster_profile.moid
  }
  depends_on = [intersight_hyperflex_cluster_profile.cluster_profile]
}

# Create external FC storage policy if var.additional_vHBAs is true 
resource "intersight_hyperflex_ext_fc_storage_policy" "ext_fc_storage_policy" {
  count = var.additional_vHBAs ? 1 : 0
  name = "${var.cluster_name}-ext-fc-storage-policy"
  admin_state = var.additional_vHBAs
  exta_traffic {
    name = var.fc_vsan_a_name
    vsan_id = var.fc_vsan_a_id
  }
  extb_traffic {
    name = var.fc_vsan_b_name
    vsan_id = var.fc_vsan_b_id
  }
  wwxn_prefix_range {
    start_addr = var.fc_wwxn_range_start
    end_addr = var.fc_wwxn_range_end
  }
  cluster_profiles {
    moid = intersight_hyperflex_cluster_profile.cluster_profile.moid
  }
  depends_on = [intersight_hyperflex_cluster_profile.cluster_profile]
}

# Create HX auto support policy if var.auto_support_enable is true
resource "intersight_hyperflex_auto_support_policy" "auto_support_policy" {
  count = var.auto_support_enable ? 1 : 0
  name = "${var.cluster_name}-auto-support-policy"
  admin_state = var.auto_support_enable
  service_ticket_receipient = var.auto_support_recipient
  cluster_profiles {
    moid = intersight_hyperflex_cluster_profile.cluster_profile.moid
  }
  depends_on = [intersight_hyperflex_cluster_profile.cluster_profile]
}

# Create HX proxy setting policy if var.proxy_enable is true
resource "intersight_hyperflex_proxy_setting_policy" "proxy_setting_policy" {
  count = var.proxy_enable ? 1 : 0
  name = "${var.cluster_name}-proxy-setting-policy"
  hostname = var.proxy_hostname
  port = var.proxy_port
  cluster_profiles {
    moid = intersight_hyperflex_cluster_profile.cluster_profile.moid
  }
  depends_on = [intersight_hyperflex_cluster_profile.cluster_profile]
}

# Retrieve server moids from interisght-moids module
module "intersight-moids" {
  source            = "../intersight-moids"
  server_names      = var.server_names
}

# Create an HX node profile for each server listed in var.server_names
resource "intersight_hyperflex_node_profile" "hyperflex_node_profile" {
  name = var.server_names[count.index].hostname
  assigned_server {
    moid = module.intersight-moids.server_moids[count.index].moid
  }
  cluster_profile {
    moid = intersight_hyperflex_cluster_profile.cluster_profile.moid
  }
  count = length(var.server_names)
  depends_on = [intersight_hyperflex_cluster_profile.cluster_profile, intersight_hyperflex_node_config_policy.node_config_policy]
}
