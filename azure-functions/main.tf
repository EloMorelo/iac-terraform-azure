
resource "azurerm_resource_group" "group" {
  name     = var.resource_group_name
  location = var.resource_group_location
}

resource "azurerm_storage_account" "accstore" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.group.name
  location                 = azurerm_resource_group.group.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

resource "azurerm_service_plan" "serviceplan" {
  name                = var.service_plan_name
  location            = azurerm_resource_group.group.location
  resource_group_name = azurerm_resource_group.group.name
  os_type             = "Linux"
  sku_name            = var.service_plan_sku
}

resource "azurerm_linux_function_app" "linuxfunction" {
  name                       = var.function_app_name
  location                   = azurerm_resource_group.group.location
  resource_group_name        = azurerm_resource_group.group.name
  service_plan_id            = azurerm_service_plan.serviceplan.id
  storage_account_name       = azurerm_storage_account.accstore.name
  storage_account_access_key = azurerm_storage_account.accstore.primary_access_key

  site_config {}

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = var.function_app_runtime
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}

resource "azurerm_function_app_function" "appfunction" {
  name            = var.app_function_name
  function_app_id = azurerm_linux_function_app.linuxfunction.id
  language        = var.app_function_language
  test_data       = var.app_function_test_data
  config_json     = var.app_function_config_json
}
