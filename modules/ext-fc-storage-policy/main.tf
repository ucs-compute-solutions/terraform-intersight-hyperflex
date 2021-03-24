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

# Create the external FC storage policy for standard clusters only
resource "intersight_hyperflex_ext_fc_storage_policy" "ext_fc_storage_policy" {
  count = var.edge_cluster ? 0 : 1
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
  organization {
    moid = var.intersight_organization_moid
  }
  cluster_profiles  {
    moid = var.cluster_moid
  }
}