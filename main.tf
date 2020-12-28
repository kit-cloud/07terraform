provider "azurerm" {
  version = "=2.20.0"
  features {}
}

required_providers {

}

locals {
  deployment_name   = "single-proxy"
  location          = "eastus"
  zone_name         = "example.com"
  nodes_record_name = "nodes"
}


module "proxy_container" {
  source = "./modules/proxy-container"
  deployment_name     = "${local.deployment_name}-node"
  resource_group_name = "CloudTech"
  location            = local.location
  nodes_count         = 1
  image               = "docker.io/zaazp/dockerproxy"
  port                = 80
}