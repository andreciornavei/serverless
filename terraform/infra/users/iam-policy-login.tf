resource "aws_iam_policy" "login_policy" {
  name        = "${var.environment}-login-policy"
  description = "This policy allows labdas to make queries on users dynamodb table"

  policy = templatefile("${path.module}/templates/dynamodb-policy.tpl",{
    action    = "dynamodb:Query",
    resource  = "${aws_dynamodb_table.users.arn}/index/${var.environment}-email-gsi"
  })
}