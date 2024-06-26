variable "resource_group_name" {
  type        = string
  default     = "example-rg"
}

variable "resource_group_location" {
  type        = string
  default     = "West Europe"
}

variable "storage_account_name" {
  type        = string
  default     = "examplestorageacct01"
}

variable "storage_account_tier" {
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  type        = string
  default     = "LRS"
}

variable "storage_container_name" {
  type        = string
  default     = "example-container"
}

variable "blob_name" {
  type        = string
  default     = "example-blob"
}

variable "blob_source" {
  type        = string
  default     = "output/app.zip"
}
