resource "aws_iam_policy" "policy" {
  name        = "test_policy"
  path        = "/"
  description = "My test policy"
  policy = <<POLICY
{
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
}
POLICY
}

resource "aws_s3_bucket" "test" {
    # bridgecrew:skip=BC_AWS_S3_16: version disabled is fine
    # bridgecrew:skip=BC_AWS_S3_24: MFA off
}