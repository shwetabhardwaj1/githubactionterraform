# App Service Plan (Consumption - Windows)
resource "azurerm_service_plan" "function_plan" {
  name                = "dotnet-function-plan-demo"
  location            = "UK South"
  resource_group_name = data.azurerm_resource_group.rg.name
  os_type             = "Windows"
  sku_name            = "F1"  
  worker_count = 1
}