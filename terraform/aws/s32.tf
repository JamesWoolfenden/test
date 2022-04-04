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

resource "aws_s3_bucket" "duff_log_bucket" {
  bucket = "duff-log-bucket"
}


resource "aws_s3_bucket_versioning" "duff_log_bucket" {
  bucket = aws_s3_bucket.duff_log_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_logging" "duff" {
  bucket = aws_s3_bucket.duff.id

  target_bucket = aws_s3_bucket.duff_log_bucket.id
  target_prefix = "log/"
}

resource "aws_s3_bucket_versioning" "duff" {
  bucket = aws_s3_bucket.duff.id

  versioning_configuration {
    status = "Enabled"
  }
}