variable "table_name" {
  description = "Table name"
  type        = string
}

variable "hash_key" {
  description = "The attribute to use as the hash (partition) key"
  type        = string
}

variable "attributes" {
  description = "List of nested attribute definitions. Example: [{ name = \"id\", type = \"S\" }]"
  type        = list(map(string))
  validation {
    condition = alltrue([
      for attr in var.attributes :
      contains(keys(attr), "name") && contains(keys(attr), "type")
    ])
    error_message = "Each attribute must have 'name' and 'type' keys."
  }
  validation {
    condition = alltrue([
      for attr in var.attributes :
      contains(["S", "N", "B"], attr["type"])
    ])
    error_message = "Each attribute 'type' must be one of: 'S' (String), 'N' (Number), 'B' (Binary)."
  }
}

# optional variable

variable "range_key" {
  description = "The attribute to use as the range (sort) key"
  type        = string
  default     = null
}

variable "ttl_attribute" {
  description = "The name of the table attribute to store the TTL timestamp"
  type        = string
  default     = null
}

variable "global_secondary_indexes" {
  description = "List of GSI configurations"
  type        = any
  default     = []
  validation {
    condition = alltrue([
      for gsi in var.global_secondary_indexes :
      contains(keys(gsi), "name") &&
      contains(keys(gsi), "hash_key") &&
      contains(keys(gsi), "projection_type")
    ])
    error_message = "Each GSI must have 'name', 'hash_key', and 'projection_type' keys."
  }
  validation {
    condition = alltrue([
      for gsi in var.global_secondary_indexes :
      contains(["ALL", "KEYS_ONLY", "INCLUDE"], gsi["projection_type"])
    ])
    error_message = "Each GSI 'projection_type' must be one of: 'ALL', 'KEYS_ONLY', 'INCLUDE'."
  }
}

variable "local_secondary_indexes" {
  description = "List of LSI configurations"
  type        = any
  default     = []
  validation {
    condition = alltrue([
      for lsi in var.local_secondary_indexes :
      contains(keys(lsi), "name") &&
      contains(keys(lsi), "range_key") &&
      contains(keys(lsi), "projection_type")
    ])
    error_message = "Each LSI must have 'name', 'range_key', and 'projection_type' keys."
  }
  validation {
    condition = alltrue([
      for lsi in var.local_secondary_indexes :
      contains(["ALL", "KEYS_ONLY", "INCLUDE"], lsi["projection_type"])
    ])
    error_message = "Each LSI 'projection_type' must be one of: 'ALL', 'KEYS_ONLY', 'INCLUDE'."
  }
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
  description = "The number of write units for this table. Required when billing_mode is 'PROVISIONED'."
  type        = number
  default     = 5
  validation {
    condition     = var.billing_mode != "PROVISIONED" || var.write_capacity != null
    error_message = "The 'write_capacity' variable is required when 'billing_mode' is 'PROVISIONED'."
  }
}

variable "read_capacity" {
  description = "The number of read units for this table. Required when billing_mode is 'PROVISIONED'."
  type        = number
  default     = 5
  validation {
    condition     = var.billing_mode != "PROVISIONED" || var.read_capacity != null
    error_message = "The 'read_capacity' variable is required when 'billing_mode' is 'PROVISIONED'."
  }
}

variable "deletion_protection_enabled" {
  description = "Enables deletion protection for the table"
  type        = bool
  default     = false
}

# tags

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  default     = {}
  validation {
    condition = contains(keys(var.tags), "git_repository")
    error_message = "The 'git_repository' tag is mandatory."
  }
}