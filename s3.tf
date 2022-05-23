resource "aws_s3_bucket" "bucket" {
  bucket = "my-pc-aws-demo-tf-test-bucket"

  tags = {
    Name                 = "My bucket"
    Environment          = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "access_good_b" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

