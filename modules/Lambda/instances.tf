resource "aws_iam_role" "role_for_LDC" {
  name = "myrole"
  assume_role_policy = file("assume_role_policy.json")
}


resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = aws_iam_role.role_for_LDC.id
  policy = file("policy.json")
}

resource "aws_lambda_function" "lambda_inserir" {
  filename      = "inserir.zip"
  function_name = "lambda_inserir"
  role          = aws_iam_role.role_for_LDC.arn
  handler       = "inserir.handler"
  runtime       = "python3.9"
}

resource "aws_lambda_function" "lambda_consulta" {
  filename      = "consulta.zip"
  function_name = "lambda_consulta"
  role          = aws_iam_role.role_for_LDC.arn
  handler       = "consuta.handler"
  runtime       = "python3.9"
}