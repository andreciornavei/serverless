resource "aws_iam_policy" "sms_policy" {
  name        = "${var.environment}-sms-policy"
  description = "This policy allows sms lambda to access sqs events "

  policy = templatefile("${path.module}/templates/lambda-sqs-policy.tpl",{
    action    = join("\",\"", ["sqs:ReceiveMessage", "sqs:DeleteMessage", "sqs:GetQueueAttributes"]),
    resource  = "${aws_sqs_queue.sms.arn}"
  })
}