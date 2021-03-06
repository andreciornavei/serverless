resource "aws_iam_policy" "bookings_stream_consumer_policy" {
  name        = "${var.environment}-bookings-stream-consumer-policy"
  description = "This policy allows consumer labda to access bookings stream in dynamoDb "

  policy = templatefile("${path.module}/templates/dynamodb-policy.tpl",{
    action    = join("\",\"", ["dynamodb:DescribeStream", "dynamodb:GetRecords", "dynamodb:GetShardIterator", "dynamodb:ListStreams"]),
    resource  = "${aws_dynamodb_table.bookings.stream_arn}",
    sns_topic = "${var.sns_notifications_arn}"
  })
}