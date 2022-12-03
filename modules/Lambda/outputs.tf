output "lambda_consulta_arn" {
  description = "The public ip for this instance"
  value = aws_lambda_function.lambda_consulta.invoke_arn
}

output "lambda_inserir_arn" {
  description = "The public ip for this instance"
  value = aws_lambda_function.lambda_inserir.invoke_arn
}

output "lambda_consulta_name" {
  description = "The public ip for this instance"
  value = aws_lambda_function.lambda_consulta.function_name
}

output "lambda_inserir_name" {
  description = "The public ip for this instance"
  value = aws_lambda_function.lambda_inserir.function_name
}