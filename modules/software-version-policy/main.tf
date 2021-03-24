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

#Create the HX software version policy for an HX Edge cluster
resource "intersight_hyperflex_software_version_policy" "software_version_edge_policy" {
  count = var.edge_cluster ? 1 : 0
  name = "${var.cluster_name}-software-version-policy"
  hxdp_version = var.hxdp_version
  organization {
    moid = var.intersight_organization_moid
  }
  cluster_profiles  {
    moid = var.cluster_moid
  }
}

#Create the HX software version policy for a standard HX cluster
resource "intersight_hyperflex_software_version_policy" "software_version_policy" {
  count = var.edge_cluster ? 0 : 1
  name = "${var.cluster_name}-software-version-policy"
  hxdp_version = var.hxdp_version
  server_firmware_version = var.firmware_version
  organization {
    moid = var.intersight_organization_moid
  }
  cluster_profiles  {
    moid = var.cluster_moid
  }
}