resource "aws_timestreamwrite_database" "example" {
  database_name = "database-example"
  kms_key_id    = aws_kms_key.example.arn

  tags = {
    Name = "value"
  }
}

