# Terraform AWS DynamoDB Module

This Terraform module creates a DynamoDB table in AWS.

## Features

- Create a DynamoDB table

## Usage

```hcl
module "dynamodb_table" {
  source             = "github.com/DanHenrique/terraform-aws-dynamodb?ref=v1.0.0"
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
    Repository = "https://github.com/DanHenrique/terraform-aws-dynamodb"
  }
}
```

### Terraform steps

1. **Initialize Terraform**:
  This command prepares the working directory by downloading the necessary plugins.

    ```bash
    terraform init
    ```

2. Check the Execution Plan:
  Create an execution plan to see the changes Terraform will make to the infrastructure.

    ```bash
    terraform plan -out=tfplan
    ```

3. Apply the Execution Plan:
  Apply the planned changes to create/modify the resources in your infrastructure.

    ```bash
    terraform apply tfplan
    ```

4. (Optional) Destroy the Resources:
  If you need to remove all resources managed by Terraform, use the destroy command.

    ```bash
    terraform destroy
    ```

## Inputs

| Input               | Description                                                  | Example                      |
|---------------------|--------------------------------------------------------------|------------------------------|
| `table_name`        | The name of the DynamoDB table.                              | `"my-table"`                 |
| `billing_mode`      | The billing mode of the DynamoDB table.                      | `"PAY_PER_REQUEST"`          |
| `pk_name`           | The name of the partition key.                               | `"pk"`                       |
| `pk_type`           | The type of the partition key.                               | `"S"`                        |
| `sk_name`           | The name of the sort key.                                    | `"sk"`                       |
| `sk_type`           | The type of the sort key.                                    | `"S"`                        |
| `ttl_enabled`       | Whether TTL is enabled for the table.                        | `true`                       |
| `ttl_attribute_name`| The name of the TTL attribute.                               | `"ttl"`                      |
| `tags`              | A map of tags to add to the DynamoDB table.                  | `{creator: "danhenrique"...}`|

## Outputs

| Name                  | Description                                           |
|-----------------------|-------------------------------------------------------|
| table_name            | The table name.                                       |
| table_arn             | The table arn.                                        |

## Examples

- [Basic Usage](examples/)

## License

N/A
