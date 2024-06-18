# Terraform AWS IAM Module

This Terraform module creates an AWS IAM Role along with its associated policies.

## Features

- Create an IAM Role in AWS.
- Create policies in AWS.
- Attach policies to the IAM Role.

## Usage

```hcl
module "iam_role_with_policies" {
  source               = "github.com/DanHenrique/terraform-aws-lambda?ref=v1.0.0"
  role_name            = "ExampleRole"
  assume_role_policy_document = file("./role/role.json")

  policies = [
    {
      name        = "ExamplePolicy"
      description = "Policy for resource access"
      document    = file("./policy/policy.json")
    }
    # Adicione mais políticas conforme necessário
  ]
}

```

## Inputs

| Name               | Description                                      | Type                | Default | Required |
|--------------------|--------------------------------------------------|---------------------|---------|----------|
| role_name          | The name of the IAM Role to create               | string              | n/a     | yes      |
| assume_role_policy_document | Link to a JSON file containing the IAM policy document that grants an entity permission to assume the role | string | `null` | yes |
| policies           | List of policies to attach to the IAM Role      | list(object({name = string, description = string, document = string})) | `[]` | yes |

### `policies` Inputs

Each object in the `policies` list should contain the following fields:

| Name        | Description                                        | Type   | Required |
|-------------|----------------------------------------------------|:------:|:--------:|
| name        | The name of the policy                             | string | yes      |
| description | The description of the policy                      | string | yes      |
| document    | Link to a JSON file containing the policy document | string | yes      |


## Outputs

| Name                  | Description                                           |
|-----------------------|-------------------------------------------------------|
| role_id               | The ID of the IAM Role created by this module.        |
| policy_arns           | The ARNs of the IAMs Policies created by this module. |

## Examples

- [Basic Usage](examples/)

## License

N/A
