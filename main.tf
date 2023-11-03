resource "aws_kms_key" "key" {
  description             = "KMS key for encrypting CloudWatch logs"
  deletion_window_in_days = 7
  enable_key_rotation     = true
}

resource "aws_kms_alias" "alias" {
  name          = "alias/${var.name}"
  target_key_id = aws_kms_key.key.key_id
}

resource "aws_kms_key_policy" "policy" {
  key_id = aws_kms_key.key.id
  policy = data.aws_iam_policy_document.key_policy.json
}

resource "aws_cloudwatch_log_group" "this" {
  name              = var.name
  kms_key_id        = aws_kms_key.key.arn
  retention_in_days = var.retention_in_days != null ? var.retention_in_days : 365
  skip_destroy      = var.destroy != null ? var.destroy : false
}
