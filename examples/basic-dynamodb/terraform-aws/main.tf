module "basic_dynamodb" {
  source = "../../modules/dynamodb"

  # mandatory
  table_name = "basic-dynamodb-example" # TODO: replace with your table name
  hash_key   = "id"                     # TODO: replace with your partition key attribute name

  attributes = [
    { name = "id", type = "S" } # TODO: replace with your attribute definitions (S = String, N = Number, B = Binary)
  ]

  # range (sort) key (optional)
  # range_key = "created_at" # TODO: uncomment and set if your table needs a sort key
  # If using range_key, add its attribute to the attributes list above, e.g.:
  # { name = "created_at", type = "S" }

  # TTL (optional)
  # ttl_attribute = "expires_at" # TODO: uncomment and set the attribute name that stores the TTL timestamp

  # billing (optional)
  # billing_mode   = "PAY_PER_REQUEST" # default: PAY_PER_REQUEST
  # write_capacity = 5                 # only required when billing_mode = "PROVISIONED"
  # read_capacity  = 5                 # only required when billing_mode = "PROVISIONED"

  # deletion protection (optional)
  # deletion_protection_enabled = false # default: false

  # tags
  tags = {
    git_repository = "owner/repository" # TODO: replace with your repository
    environment    = "dev"              # TODO: replace with your environment
  }
}
