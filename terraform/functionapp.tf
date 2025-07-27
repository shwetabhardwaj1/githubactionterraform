# Window Function App with Managed Identity
resource "azurerm_windows_function_app" "demo_func" {
  name                = "my-windows-function-app-demo"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  service_plan_id            = azurerm_service_plan.function_plan.id
  storage_account_name = azurerm_storage_account.storageaccountdemo.name
  storage_account_access_key = azurerm_storage_account.storageaccountdemo.primary_access_key

  functions_extension_version = "~4"  # Targets .NET 6+
 site_config {
    application_stack {
      dotnet_version = "6.0"  # Update to your desired .NET version
    }
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
  scope                = azurerm_storage_account.storageaccountdemo.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_function_app.demo_func.identity.principal_id
}
