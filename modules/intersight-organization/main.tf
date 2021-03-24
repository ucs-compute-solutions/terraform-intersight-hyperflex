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
data "intersight_organization_organization" "intersight_organization" {
  name = var.intersight_organization_name
}

# Output the Intersight organization moid for use in the parent module
output organization_moid {
    value = data.intersight_organization_organization.intersight_organization.results[0].moid
}