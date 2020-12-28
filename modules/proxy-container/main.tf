# Create node container resource
resource "azurerm_container_group" "this" {
  name                = "aci-${var.deployment_name}-singleproxy"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = "public"
  os_type             = "Linux"

  container {
    name   = "${var.deployment_name}-singleproxy"
    image  = var.image
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = var.port
      protocol = "TCP"
    }
  }
}
