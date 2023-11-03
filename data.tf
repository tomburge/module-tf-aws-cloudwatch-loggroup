data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_iam_policy_document" "key_policy" {
  statement {
    actions = [
      "kms:*"
    ]
    principals {
      type        = "AWS"
      identifiers = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
    }
    resources = ["*"]
    effect    = "Allow"
  }

  statement {
    actions = [
      "kms:Decrypt*",
      "kms:Describe*",
      "kms:Encrypt*",
      "kms:GenerateDataKey*",
      "kms:ReEncrypt*"
    ]
    principals {
      type        = "Service"
      identifiers = "logs.${data.aws_region.current.name}.amazonaws.com"
    }
    resources = ["${aws_cloudwatch_log_group.flow_log_group.this.arn}"]
    effect    = "Allow"
  }
}
