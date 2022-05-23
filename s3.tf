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

resource "aws_s3_bucket_public_access_block" "access_good_b" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

