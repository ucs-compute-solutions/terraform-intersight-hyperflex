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

# Create the HX Edge cluster network policy
resource "intersight_hyperflex_cluster_network_policy" "cluster_network_edge_policy" {
  count = var.edge_cluster ? 1 : 0
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
  organization {
    moid = var.intersight_organization_moid
  }
  cluster_profiles  {
    moid = var.cluster_moid
  }
}

# Create the standard HX cluster network policy
resource "intersight_hyperflex_cluster_network_policy" "cluster_network_policy" {
  count = var.edge_cluster ? 0 : 1
  name = "${var.cluster_name}-cluster-network-policy"
  jumbo_frame = var.jumbo_frame
  kvm_ip_range {
    start_addr = var.kvm_ip_start
    end_addr = var.kvm_ip_end
    netmask = var.kvm_netmask
    gateway = var.kvm_gateway
  }
  mac_prefix_range {
    start_addr = var.mac_prefix
    end_addr = var.mac_prefix
  }
  mgmt_vlan {
    name = var.mgmt_vlan_name
    vlan_id = var.mgmt_vlan_id
  }
  vm_migration_vlan {
    name = var.vmotion_vlan_name
    vlan_id = var.vmotion_vlan_id
  }
  vm_network_vlans = var.vm_vlans
  organization {
    moid = var.intersight_organization_moid
  }
  cluster_profiles  {
    moid = var.cluster_moid
  }
}