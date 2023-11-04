# Resources
module "kms_key" {
  source = "github.com/tomburge/module-tf-aws-kms-key?ref=main"
  count  = var.key_arn == null ? 1 : 0
  name   = var.name
  targets = [
    {
      target_type = "cw_loggroup"
    }
  ]
}

resource "aws_cloudwatch_log_group" "this" {
  name              = var.name
  kms_key_id        = var.key_arn != null ? var.key_arn : try(module.kms_key[0].key_arn, null)
  retention_in_days = var.retention_days != null ? var.retention_days : 365
  skip_destroy      = var.destroy != null ? var.destroy : false
}

resource "aws_cloudwatch_log_data_protection_policy" "this" {
  log_group_name  = aws_cloudwatch_log_group.this.name
  policy_document = data.aws_cloudwatch_log_data_protection_policy_document.this.json
}
