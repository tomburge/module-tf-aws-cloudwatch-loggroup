# module-tf-aws-cloudwatch-loggroup

## What does this module do?

-   Creates CloudWatch Log Group
    -   Sets default retention to 365 if not specified
    -   Allows skip destroy by default
-   Creates CloudWatch Log Group Potection Policy
-   Creates KMS Key, Key Alias, and Key Policy for Log Group if a Key ARN isn't specified.

## Configuration Options:

-   destroy (bool): true | (Default) false
-   key_arn (string)
-   key_config (object):
    -   delete_days (number): (Default) 7 | 7-30
    -   description (string)
    -   enable (bool): (Default) true | false
    -   key_spec (string): (Default) SYMMETRIC_DEFAULT | RSA_2048 | RSA_3072 | RSA_4096 | HMAC_256 | ECC_NIST_P256 | ECC_NIST_P384 | ECC_NIST_P521 | ECC_SECG_P256K1
    -   multi_region (bool): true | (Default) false
    -   rotation (bool): true | (Default) false
    -   usage (string): (Default) ENCRYPT_DECRYPT | SIGN_VERIFY | GENERATE_VERIFY_MAC
-   name (string)
-   protection_policy (object):
    -   credentials (bool): (Default) true | false
    -   device_identitifers (bool): (Default) true | false
    -   financial_information (bool): (Default) true | false
    -   phi (bool): (Default) true | false
    -   pii (bool): (Default) true | false
-   retention_days (number):

## Example Module Configuration:

```
module  "log_group" {
	source  =  "github.com/tomburge/module-tf-aws-cloudwatch-loggroup?ref=main"
	name =  "toms-test-log-group"
	destroy = true
	retention_days = 365
}
```
