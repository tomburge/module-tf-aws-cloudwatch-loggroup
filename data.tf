# Data
data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_cloudwatch_log_data_protection_policy_document" "this" {
  name = "data-protection-policy"

  statement {
    sid = "audit-policy"

    data_identifiers = local.protection_list

    operation {
      audit {
        findings_destination {}
      }
    }
  }

  statement {
    sid = "deidentify-policy"

    data_identifiers = local.protection_list

    operation {
      deidentify {
        mask_config {}
      }
    }
  }
}
