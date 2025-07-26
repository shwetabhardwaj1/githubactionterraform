
resource "azurerm_storage_account" "storageaccountdemo" {
  name                     = var.storageAccountName
  resource_group_name      = var.resourceGroupName
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "development"
    application = "Terraform1Git1HubActions121"
    managed_by  = "TqerrqaformDemo123456911"

  }
}
