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

# Create the HX Edge cluster storage policy
resource "intersight_hyperflex_cluster_storage_policy" "cluster_storage_edge_policy" {
  count = var.edge_cluster ? 1 : 0
  name = "${var.cluster_name}-cluster-storage-policy"
  disk_partition_cleanup = var.disk_cleanup
  vdi_optimization = var.vdi_opt
  organization {
    moid = var.intersight_organization_moid
  }
  cluster_profiles  {
    moid = var.cluster_moid
  }
}

# Create the standard HX cluster storage policy
resource "intersight_hyperflex_cluster_storage_policy" "cluster_storage_policy" {
  count = var.edge_cluster ? 0 : 1
  name = "${var.cluster_name}-cluster-storage-policy"
  disk_partition_cleanup = var.disk_cleanup
  vdi_optimization = var.vdi_opt
  logical_avalability_zone_config {
    auto_config = var.laz_config
  }
  organization {
    moid = var.intersight_organization_moid
  }
  cluster_profiles  {
    moid = var.cluster_moid
  }
}