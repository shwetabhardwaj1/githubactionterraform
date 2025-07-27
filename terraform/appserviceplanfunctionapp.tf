# App Service Plan (Consumption - Windows)
resource "azurerm_service_plan" "function_plan" {
  name                = "dotnet-function-plan-demo"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  os_type             = "Windows"
  sku_name            = "Y1"  # This corresponds to the Consumption plan
}