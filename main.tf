resource "aws_dynamodb_table" "table" {
  name           = var.table_name

  billing_mode   = var.billing_mode
  write_capacity = var.billing_mode == "PROVISIONED" ? var.write_capacity : null
  read_capacity  = var.billing_mode == "PROVISIONED" ? var.read_capacity : null

  hash_key       = var.pk_name
  attribute {
    name = var.pk_name
    type = var.pk_type
  }

  range_key = var.sk_name != "" ? var.sk_name : null
  dynamic "attribute" {
    for_each = var.sk_name != "" ? [1] : []
    content {
      name = var.sk_name
      type = var.sk_type
    }
  }

  dynamic "ttl" {
    for_each = var.ttl_enabled ? [1] : []
    content {
      attribute_name = var.ttl_attribute_name
      enabled        = var.ttl_enabled
    }
  }

  tags = merge(var.tags, { "module_maintainer" = "DanHenrique" })
}
