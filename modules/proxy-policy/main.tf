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

# Create the HX proxy setting policy
resource "intersight_hyperflex_proxy_setting_policy" "proxy_setting_policy" {
  name = "${var.cluster_name}-proxy-setting-policy"
  hostname = var.proxy_hostname
  port = var.proxy_port
  username = var.proxy_username
  password = var.proxy_password
  organization {
    moid = var.intersight_organization_moid
  }
  cluster_profiles  {
    moid = var.cluster_moid
  }
}