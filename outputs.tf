output "role_arn" {
  value = aws_iam_role.role.arn
}

output "policy_arns" {
  value = {
    for name, policy in aws_iam_policy.policies : name => policy.arn
  }
}
