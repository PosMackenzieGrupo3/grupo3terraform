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
        },
        {
            "Sid": "SpecificTable",
            "Effect": "Allow",
            "Action": [
                "dynamodb:BatchGet*",
                "dynamodb:DescribeStream",
                "dynamodb:DescribeTable",
                "dynamodb:Get*",
                "dynamodb:Query",
                "dynamodb:Scan",
                "dynamodb:BatchWrite*",
                "dynamodb:CreateTable",
                "dynamodb:Delete*",
                "dynamodb:Update*",
                "dynamodb:PutItem"
            ],
            "Resource": "arn:aws:dynamodb:*:*:table/webservicepos"
        }
    ]
}
  EOF
}

resource "aws_lambda_function" "lambda_inserir" {
  filename      = "inserir.zip"
  function_name = "lambda_inserir"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "inserir.handler"
  runtime       = "python3.9"
}

resource "aws_lambda_function" "lambda_consulta" {
  filename      = "consulta.zip"
  function_name = "lambda_consulta"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "consuta.handler"
  runtime       = "python3.9"
}