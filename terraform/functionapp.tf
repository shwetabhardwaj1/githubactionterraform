# Function App with Managed Identity
resource "azurerm_function_app" "demo_func" {
  name                = "dotnet-function-tf-demo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.function_plan.id
  storage_account_name = azurerm_storage_account.storage.name
  storage_account_access_key = azurerm_storage_account.storage.primary_access_key

  version = "~4"  # Targets .NET 6+

  os_type = "Windows"

  site_config {
    ftps_state = "Disabled"
  }

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"     = "dotnet"
    "WEBSITE_RUN_FROM_PACKAGE"     = "1"
  }

  identity {
    type = "SystemAssigned"
  }
}

# Role Assignment: Allow Function App to access Storage
resource "azurerm_role_assignment" "storage_contributor" {
  scope                = azurerm_storage_account.storage.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_function_app.demo_func.identity.principal_id
}
