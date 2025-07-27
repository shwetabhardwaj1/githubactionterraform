# App Service Plan (Consumption - Windows)
resource "azurerm_app_service_plan" "function_plan" {
  name                = "dotnetfunction-plan-demo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  kind = "FunctionApp"

  sku {
    tier = "Dynamic"
    size = "Y1"  # This maps to the Consumption Plan
  }

  reserved = false  # false = Windows; true = Linux
}