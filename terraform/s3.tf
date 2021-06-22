resource "aws_s3_bucket" "toxic" {
	# checkov:skip=CKV_AWS_144: ADD REASON

# Two suppression formats:
# checkov:skip:
# or
# bridgecrew:skip=BC_AWS_NETWORKING_52:no comments
# bridgecrew:skip=BC_AWS_S3_16: version disabled ias fine
}
