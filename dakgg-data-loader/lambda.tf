# iam role
resource "aws_iam_role" "lambda_role" {
   name = "dernal_router_lambda"
   assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_role_policy" "lambda_policy" {
  name = "lambda_policy"
  role = aws_iam_role.lambda_role.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
          "dynamodb:BatchGetItem",
          "dynamodb:GetItem",
          "dynamodb:Query",
          "dynamodb:Scan",
          "dynamodb:BatchWriteItem",
          "dynamodb:PutItem",
          "dynamodb:UpdateItem"
      ],
      "Resource": "arn:aws:dynamodb:us-east-1:679411612526:table/dernal-router-data"
    }
  ]
}
EOF

}

# lambda
resource "aws_lambda_function" "data_loader_lambda" {
   function_name = "dakgg-data-loader"

   filename = var.dakgg_data_loader_location

   handler = "lambda_function.lambda_handler"
   runtime = "python3.8"

   role = aws_iam_role.lambda_role.arn
}
