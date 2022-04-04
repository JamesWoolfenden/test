resource "aws_s3_bucket" "duff" {
  
}

resource "aws_s3_bucket_server_side_encryption_configuration" "duff" {
  bucket = aws_s3_bucket.duff.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}