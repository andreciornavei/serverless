resource "aws_iam_policy" "email_policy" {
  name        = "${var.environment}-email-policy"
  description = "This policy allows email lambda to access sqs events "

  policy = templatefile("${path.module}/templates/lambda-sqs-policy.tpl",{
    action    = join("\",\"", ["sqs:ReceiveMessage", "sqs:DeleteMessage", "sqs:GetQueueAttributes"]),
    resource  = "${aws_sqs_queue.email.arn}"
  })
}