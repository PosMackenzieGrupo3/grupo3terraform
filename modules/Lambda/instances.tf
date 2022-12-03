  resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Effect": "Allow"
        }
    ]
}
  EOF
}

resource "aws_lambda_function" "lambda_inserir" {
  filename      = "inserir.zip"
  function_name = "lambda_inserir"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"
  runtime       = "python3.9"
}

resource "aws_lambda_function" "lambda_consulta" {
  filename      = "consulta.zip"
  function_name = "lambda_consulta"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"
  runtime       = "python3.9"
}