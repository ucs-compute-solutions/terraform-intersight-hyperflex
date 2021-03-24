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

# Create the HX system configuration policy
resource "intersight_hyperflex_sys_config_policy" "system_config_policy" {
  name = "${var.cluster_name}-sys-config-policy"
  timezone = var.timezone
  dns_domain_name = var.dns_domain
  dns_servers = var.dns
  ntp_servers = var.ntp
  organization {
    moid = var.intersight_organization_moid
  }
  cluster_profiles {
    moid = var.cluster_moid
  }
}