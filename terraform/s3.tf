resource "aws_s3_bucket" "toxic" {
# bridgecrew:skip=BC_AWS_NETWORKING_52:nocomments
# bridgecrew:skip=BC_AWS_S3_16: version disabled ias fine
}

/*
The lookup for BC issues to checkov suppressions is broken for some checks but not all:

BC_AWS_S3_24: should suppress MFA or checkov CKV_AWS_52 -> https://docs.bridgecrew.io/docs/bc_aws_s3_24 but it suppresses 
 CKV_AWS_93: "Ensure S3 bucket policy does not lockout all but root user. (Prevent lockouts needing root account fixes)" instead.
 */