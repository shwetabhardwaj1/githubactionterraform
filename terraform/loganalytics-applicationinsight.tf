resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "loganalytics-func-demo"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30 # adjust as needed
}

resource "azurerm_application_insights" "app_insights" {
  name                = "funcapp-insights-demo"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  application_type    = "web"

  workspace_id = azurerm_log_analytics_workspace.log_analytics.id
}
