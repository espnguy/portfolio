# -----------------------------------------------------------------------------
# RESOURCE GROUP
# -----------------------------------------------------------------------------

resource "azurerm_resource_group" "rg" {
  name     = "${var.project_name}-rg"
  location = var.location
}

# -----------------------------------------------------------------------------
# ACR (Azure Container Registry)
# -----------------------------------------------------------------------------

resource "azurerm_container_registry" "acr" {
  name                = "${var.project_name}acr"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = var.acr_sku
  admin_enabled       = true
}

# -----------------------------------------------------------------------------
# APP SERVICE PLAN (LINUX)
# -----------------------------------------------------------------------------

resource "azurerm_app_service_plan" "plan" {
  name                = "${var.project_name}-plan"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku {
    tier = "Basic"
    size = var.app_service_sku
  }
  kind = "Linux"
  reserved = true
}

# -----------------------------------------------------------------------------
# WEB APP FOR CONTAINERS
# -----------------------------------------------------------------------------

resource "azurerm_linux_web_app" "app" {
  name                = "${var.project_name}-webapp"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_app_service_plan.plan.id

  site_config {
    always_on = true

    container_registry_use_managed_identity = false

    application_stack {
      docker_image     = var.container_image
      docker_image_tag = "latest"
    }
  }

  app_settings = {
    WEBSITES_PORT                           = "5000"
    DOCKER_REGISTRY_SERVER_URL              = azurerm_container_registry.acr.login_server
    DOCKER_REGISTRY_SERVER_USERNAME         = azurerm_container_registry.acr.admin_username
    DOCKER_REGISTRY_SERVER_PASSWORD         = azurerm_container_registry.acr.admin_password
  }
}
