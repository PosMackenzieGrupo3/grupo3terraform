provider "aws" {
  region = "us-east-1"
  profile = "default"
}

module "Dynamo" {
  source = "./modules/Dynamo"
}

module "Lambda" {
  source = "./modules/Lambda"
}

module "ApiGateway" {
  source = "./modules/ApiGateway"
  lambda_consultar_name = module.Lambda.lambda_consulta_arn
  lambda_inserir_name = module.Lambda.lambda_inserir_arn
}
