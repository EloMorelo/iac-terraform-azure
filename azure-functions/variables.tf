variable "resource_group_name" {
  type        = string
}

variable "resource_group_location" {
  type        = string
}

variable "storage_account_name" {
  type        = string
}

variable "storage_account_tier" {
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  type        = string
  default     = "LRS"
}

variable "service_plan_name" {
  type        = string
}

variable "service_plan_sku" {
  type        = string
  default     = "Y1" # Consumption plan
}

variable "function_app_name" {
  type        = string
}

variable "function_app_linux_fx_version" {
  type        = string
}

variable "function_app_runtime" {
  type        = string
  default     = "dotnet"
}

variable "function_name" {
  type        = string
}

variable "function_content_filepath" {
  type        = string
}

