output "table_arn" {
  description = "The ARN of the DynamoDB table"
  value       = aws_dynamodb_table.this.arn
}

output "table_id" {
  description = "The name of the table"
  value       = aws_dynamodb_table.this.id
}

output "table_stream_arn" {
  description = "The ARN of the Table Stream, if enabled"
  value       = aws_dynamodb_table.this.stream_arn
}