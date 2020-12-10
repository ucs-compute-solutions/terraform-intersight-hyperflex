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

provider "intersight" {
  apikey = var.api_key
  secretkeyfile = var.api_key_file
  endpoint = var.api_endpoint
}
