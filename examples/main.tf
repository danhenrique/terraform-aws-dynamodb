module "dynamodb_table" {
  source             = "../"
  table_name         = "my-table"
  billing_mode       = "PAY_PER_REQUEST"
  pk_name            = "pk"
  pk_type            = "S"
  sk_name            = "sk"
  sk_type            = "S"
  ttl_enabled        = true
  ttl_attribute_name = "ttl"
  tags = {
    creator        = "danhenrique"
    git_repository = "https://github.com/DanHenrique/terraform-aws-dynamodb"
  }
}