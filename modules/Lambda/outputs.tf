output "lambda_consulta_arn" {
  description = "The public ip for this instance"
  value = aws_lambda_function.lambda_consulta.invoke_arn
}

output "lambda_inserir_arn" {
  description = "The public ip for this instance"
  value = aws_lambda_function.lambda_inserir.invoke_arn
}