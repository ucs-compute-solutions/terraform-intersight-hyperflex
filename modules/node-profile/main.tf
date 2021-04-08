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

# Read the moid of the server to be associated
data "intersight_compute_physical_summary" "server_moid" {
  name  = var.intersight_name
}

# Create an HX node profile for each server listed in var.server_names
resource "intersight_hyperflex_node_profile" "hyperflex_node_profile" {
  name = var.server_name
  hypervisor_mgmt_ip = var.esx_ip
  hxdp_mgmt_ip = var.hx_ip
  assigned_server {
    moid = data.intersight_compute_physical_summary.server_moid.results[0].moid
    object_type = "compute.RackUnit"
  }
  cluster_profile {
    moid = var.cluster_moid
  }
} 
