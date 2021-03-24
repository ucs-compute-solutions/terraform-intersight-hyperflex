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

# Read the moid of the specified Intersight organization
data "intersight_hyperflex_cluster_profile" "cluster_profile_moid" {
  name = var.cluster_name
}

# Output the Intersight organization moid for use in the parent module
output cluster_moid {
    value = data.intersight_hyperflex_cluster_profile.cluster_profile_moid.results[0].moid
}