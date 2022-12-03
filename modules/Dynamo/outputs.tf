output "dynamo_name" {
  description = "The table name"
  value = aws_dynamodb_table.dynamo.name
}
