# App Service Plan (Consumption - Windows)
resource "azurerm_service_plan" "function_plan" {
  name                = "dotnet-function-plan-demo1"
  location            = "UK South"
  resource_group_name = data.azurerm_resource_group.rg.name
  os_type             = "Windows"
  sku_name            = "B1"  
  worker_count = 1
}