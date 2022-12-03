resource "aws_dynamodb_table" "dynamo" {
  name = var.dynamo_db_table_name

  billing_mode = "PAY_PER_REQUEST"

  hash_key = "CPF"

  attribute {
    name = "CPF"
    type = "S"
  }

  # attribute {
  #   name = "NOME"
  #   type = "S"
  # }

  # attributes = [
  #   {
  #     name = "CPF"
  #     type = "S"
  #   },
  #   {
  #     name = "NOME"
  #     type = "S"
  #   }
  # ]

  tags = {
    Name    = var.dynamo_db_table_name
    BuiltBy = "Terraform"
  }
}