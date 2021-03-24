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

# Create the HX Edge cluster profile
resource "intersight_hyperflex_cluster_profile" "cluster_edge_profile" {
  count = var.edge_cluster ? 1 : 0
  name = var.cluster_name
#  action = var.cluster_action
  organization {
    moid = var.intersight_organization_moid
  }
  mgmt_platform = "EDGE"
  replication = var.replication
  mgmt_ip_address = var.hx_mgmt_ip
  mac_address_prefix = var.mac_prefix
  wwxn_prefix = var.wwxn_prefix
  storage_data_vlan {
    vlan_id = var.storage_vlan_id
  }
}

# Create the standard HX cluster profile
resource "intersight_hyperflex_cluster_profile" "cluster_profile" {
  count = var.edge_cluster ? 0 : 1
  name = var.cluster_name
#  action = var.cluster_action
  organization {
    moid = var.intersight_organization_moid
  }
  mgmt_platform = "FI"
  replication = var.replication
  mgmt_ip_address = var.hx_mgmt_ip
  mac_address_prefix = var.mac_prefix
  wwxn_prefix = var.wwxn_prefix
  storage_data_vlan {
    name = var.storage_vlan_name
    vlan_id = var.storage_vlan_id
  }
}

/* # Output the HX cluster profile moid for use in the parent and other child modules
output cluster_profile_moid {
    value = intersight_hyperflex_cluster_profile[0].moid
} */