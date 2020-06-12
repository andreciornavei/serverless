resource "aws_iam_policy" "register_policy" {
  name        = "${var.environment}-register-policy"
  description = "This policy allows data insertion on users dynamodb table"

  policy = templatefile("${path.module}/templates/dynamodb-policy.tpl",{
    action    = "dynamodb:PutItem",
    resource  = "${aws_dynamodb_table.users.arn}"
  })

}