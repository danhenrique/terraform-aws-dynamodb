resource "aws_iam_role" "role" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy_document
  tags               = var.tags
}

resource "aws_iam_policy" "policies" {
  for_each = { for idx, policy in var.policies : idx => policy }

  name        = each.value.name
  description = each.value.description
  policy      = each.value.document
  tags        = var.tags
}

resource "aws_iam_role_policy_attachment" "role_attachments" {
  for_each = { for idx, policy in aws_iam_policy.policies : idx => policy }

  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policies[each.key].arn
}

resource "aws_iam_role_policy_attachment" "existing_policy_attachments" {
  count      = length(var.existing_policy_arns)
  role       = aws_iam_role.role.name
  policy_arn = var.existing_policy_arns[count.index]
}
