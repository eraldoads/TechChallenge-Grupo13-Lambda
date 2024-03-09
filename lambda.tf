resource "aws_lambda_function" "auth" {
  function_name = "auth"
  filename      = "index.zip"
  runtime       = "nodejs20.x"
  handler       = "index.handler"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  role = aws_iam_role.lambda_exec.arn

  environment {
    variables = {
      URL_BACKEND = "${data.aws_lb.alb.dns_name}"      
    }
  }
}

resource "aws_cloudwatch_log_group" "auth" {
  name = "/aws/lambda/${aws_lambda_function.auth.function_name}"

  retention_in_days = 30
}

resource "aws_iam_role" "lambda_exec" {
  name = "serverless_lambda"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}
