# module-tf-aws-cloudwatch-loggroup

## What does this module do?

-   Creates CloudWatch Log Group
    -   Sets default retention to 365 if not specified
    -   Allows skip destroy by default
-   Creates KMS Key for Log Group
-   Creates KMS Key Alias
-   Creates KMS Key Policy

## Configuration Options:

-   destroy (bool): true | false
-   name (string)
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
