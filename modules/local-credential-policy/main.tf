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

# Create the HX local credential policy
resource "intersight_hyperflex_local_credential_policy" "credential_policy" {
  name = "${var.cluster_name}-local-credential-policy"
  factory_hypervisor_password = var.factory_password
  hxdp_root_pwd = var.hx_password
  hypervisor_admin = var.esx_admin
  hypervisor_admin_pwd = var.esx_password
  organization {
    moid = var.intersight_organization_moid
  }
  cluster_profiles  {
    moid = var.cluster_moid
  }
}