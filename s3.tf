resource "aws_s3_bucket" "bucket" {
  bucket = "my-pc-aws-demo-tf-test-bucket"

  tags = {
    Name                 = "My bucket"
    Environment          = "Dev"
    git_commit           = "01ad7f23ecee1adcf7d590e0b4378b57195bb10b"
    git_file             = "s3.tf"
    git_last_modified_at = "2022-05-23 13:49:04"
    git_last_modified_by = "31355989+jjchavanne@users.noreply.github.com"
    git_modifiers        = "31355989+jjchavanne"
    git_org              = "jjchavanne"
    git_repo             = "pc-aws-demo"
    yor_trace            = "e4cade09-d0b6-4822-b8eb-27c2d57dce84"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket" {
  bucket = aws_s3_bucket.bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}

resource "aws_s3_bucket" "bucket_log_bucket" {
  bucket = "bucket-log-bucket"
  tags = {
    git_commit           = "80d6e6f0212c615a9b88157f6c1753a91dcd89a4"
    git_file             = "s3.tf"
    git_last_modified_at = "2022-05-23 18:05:06"
    git_last_modified_by = "jchavanne@paloaltonetworks.com"
    git_modifiers        = "jchavanne"
    git_org              = "jjchavanne"
    git_repo             = "pc-aws-demo"
    yor_trace            = "4f31a202-6e63-442c-8ed3-1e88d196c3b4"
  }
}

resource "aws_s3_bucket_logging" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  target_bucket = aws_s3_bucket.bucket_log_bucket.id
  target_prefix = "log/"
}

resource "aws_s3_bucket_versioning" "bucket" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "access_good_b" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

