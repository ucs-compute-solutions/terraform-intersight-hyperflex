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

# Create the external iSCSI storage policy for standard clusters only
resource "intersight_hyperflex_ext_iscsi_storage_policy" "ext_iscsi_storage_policy" {
  count = var.edge_cluster ? 0 : 1
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
  organization {
    moid = var.intersight_organization_moid
  }
  cluster_profiles  {
    moid = var.cluster_moid
  }
}