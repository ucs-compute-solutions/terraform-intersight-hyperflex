# Intersight Provider Information 
terraform {
  required_version = ">= 0.13.0"
  required_providers {
    intersight = {
      source = "CiscoDevNet/intersight"
      version = ">= 0.1.1"
    }
  }
}

data "intersight_compute_physical_summary" "server_moid" {
  name  = var.server_names[count.index].name
  count = length(var.server_names)
}

output "server_moids" {
  value = data.intersight_compute_physical_summary.server_moid
}
