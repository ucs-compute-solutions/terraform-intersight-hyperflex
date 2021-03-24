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

# Create the HX auto support policy
resource "intersight_hyperflex_auto_support_policy" "auto_support_policy" {
  name = "${var.cluster_name}-auto-support-policy"
  admin_state = var.auto_support_enable
  service_ticket_receipient = var.auto_support_recipient
  organization {
    moid = var.intersight_organization_moid
  }
  cluster_profiles  {
    moid = var.cluster_moid
  }
}