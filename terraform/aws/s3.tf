resource "aws_s3_bucket" "toxic" {

# Two suppression formats:
# checkov:skip:
# or
# bridgecrew:skip=BC_AWS_NETWORKING_52:no comments
# bridgecrew:skip=BC_AWS_S3_16: version disabled ias fine
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

