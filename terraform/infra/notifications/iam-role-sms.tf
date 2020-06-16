resource "aws_iam_role" "sms_iam_role" {
  name = "${var.environment}-sms-iam-role"
  description = "This is a role that allow sms lambda functions to read sqs events"
  assume_role_policy = templatefile("${path.module}/templates/lambda-base-policy.tpl", {})
}

resource "aws_ssm_parameter" "sms_iam_role" {
    name  = "${var.environment}-sms-iam-role"
    type  = "String"
    value = aws_iam_role.sms_iam_role.arn
}