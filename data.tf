data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "index.js"
  output_path = "index.zip"
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

data "aws_lb" "alb" {}