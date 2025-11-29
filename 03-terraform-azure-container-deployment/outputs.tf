output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "app_service_plan_name" {
  value = azurerm_app_service_plan.plan.name
}

output "webapp_url" {
  value = "https://${azurerm_linux_web_app.app.default_hostname}"
}
