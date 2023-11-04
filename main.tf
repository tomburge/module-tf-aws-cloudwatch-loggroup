# resource "aws_kms_key" "key" {
#   description             = "KMS key for encrypting CloudWatch logs"
#   deletion_window_in_days = 7
#   enable_key_rotation     = true
# }

# resource "aws_kms_alias" "alias" {
#   name          = "alias/${var.name}"
#   target_key_id = aws_kms_key.key.key_id
# }

# resource "aws_kms_key_policy" "policy" {
#   key_id = aws_kms_key.key.id
#   policy = data.aws_iam_policy_document.key_policy.json
# }

module "kms_key" {
  source = "github.com/tomburge/module-tf-aws-kms-key?ref=main"
  count  = var.key_config != null ? 1 : 0
  name   = var.name
  targets = [
    {
      target_type = "cw_loggroup"
    }
  ]
}

resource "aws_cloudwatch_log_group" "this" {
  name = var.name
  # kms_key_id        = var.key_arn != null ? var.key_arn : module.kms_key[0].key_arn
  kms_key_id        = var.key_arn != null ? var.key_arn : try(module.kms_key[0].key_arn, null)
  retention_in_days = var.retention_days != null ? var.retention_days : 365
  skip_destroy      = var.destroy != null ? var.destroy : false
}
