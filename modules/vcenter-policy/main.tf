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

# Create HX vCenter policy
resource "intersight_hyperflex_vcenter_config_policy" "vcenter_policy" {
  name = "${var.cluster_name}-vcenter-config-policy"
  hostname = var.vcenter_hostname
  username = var.vcenter_username
  password = var.vcenter_password
  data_center = var.vcenter_datacenter
  organization {
    moid = var.intersight_organization_moid
  }
  cluster_profiles  {
    moid = var.cluster_moid
  }
}