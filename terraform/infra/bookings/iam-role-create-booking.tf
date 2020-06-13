resource "aws_iam_role" "create_booking_iam_role" {
  name = "${var.environment}-create-booking-iam-role"
  description = "This is a role that allow lambda functions access"
  assume_role_policy = templatefile("${path.module}/templates/lambda-base-policy.tpl", {})
}

resource "aws_ssm_parameter" "create_booking_iam_role" {
    name  = "${var.environment}-create-booking-iam-role"
    type  = "String"
    value = aws_iam_role.create_booking_iam_role.arn
}