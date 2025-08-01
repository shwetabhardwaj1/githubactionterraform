
resource "azurerm_storage_account" "storageaccountdemo" {
  name                     = var.storageAccountName
  resource_group_name      = var.resourceGroupName
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "development"
    application = "Terfdod1sGit1HubAc121"
    managed_by  = "Te251234981156911"

  }
}
