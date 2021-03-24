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

# Create the HX node config policy
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
  organization {
    moid = var.intersight_organization_moid
  }
  cluster_profiles  {
    moid = var.cluster_moid
  }
}