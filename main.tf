resource "aws_dynamodb_table" "this" {
  name           = var.table_name

  billing_mode   = var.billing_mode
  write_capacity = var.billing_mode == "PROVISIONED" ? var.write_capacity : null
  read_capacity  = var.billing_mode == "PROVISIONED" ? var.read_capacity : null

  hash_key                    = var.hash_key
  range_key                   = var.range_key
  deletion_protection_enabled = var.deletion_protection_enabled
  
  dynamic "attribute" {
    for_each = var.attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }

  dynamic "ttl" {
    for_each = var.ttl_attribute != null ? [1] : []
    content {
      enabled        = true
      attribute_name = var.ttl_attribute
    }
  }

  tags = var.tags
}
