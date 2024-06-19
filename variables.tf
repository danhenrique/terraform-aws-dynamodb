variable "table_name" {
  description = "Table name"
  type        = string
}

variable "billing_mode" {
  description = "Billing mode"
  type        = string
  default     = "PAY_PER_REQUEST"
  validation {
    condition = var.billing_mode == "PROVISIONED" || var.billing_mode == "PAY_PER_REQUEST"
    error_message = "The billing mode must be either 'PROVISIONED' or 'PAY_PER_REQUEST'."
  }
}

variable "write_capacity" {
  description = "The number of write units for this table"
  type        = number
  default     = 5
}

variable "read_capacity" {
  description = "The number of read units for this table"
  type        = number
  default     = 5
}

variable "pk_name" {
  description = "The name of the hash key in the table. Also known as the partition key (pk)."
  type        = string
}

variable "pk_type" {
  description = "The type of the hash key in the table. Also known as the partition key (pk)."
  type        = string
  default     = "S"
}

variable "sk_name" {
  description = "The name of the range key in the table. Also known as the sort key (sk)."
  type        = string
  default     = ""
}

variable "sk_type" {
  description = "The type of the range key in the table. Also known as the sort key (sk)."
  type        = string
  default     = "S"
}

variable "ttl_attribute_name" {
  description = "The name of the TTL (Time To Live) attribute."
  type        = string
  default     = "ttl"
}

variable "ttl_enabled" {
  description = "Whether TTL (Time To Live) is enabled"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {}
  validation {
    condition = contains(keys(var.tags), "git_repository")
    error_message = "The 'git_repository' tag is mandatory."
  }
}
