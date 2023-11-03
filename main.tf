resource "aws_kms_key" "key" {
  description             = "KMS key for encrypting CloudWatch logs"
  deletion_window_in_days = 7
}

resource "aws_cloudwatch_log_group" "this" {
  name              = var.name
  kms_key_id        = aws_kms_key.key.arn
  retention_in_days = var.retention_in_days != null ? var.retention_in_days : 365
  skip_destroy      = var.destroy != null ? var.destroy : false
}
