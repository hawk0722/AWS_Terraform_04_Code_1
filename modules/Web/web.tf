# S3
## General configuration
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.project}-${var.env}-bucket-5"

  tags = {
    Name        = "${var.project}-${var.env}-bucket"
    Environment = var.env
  }
}

## Block public access (bucket settings)
resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

## Static website hosting
resource "aws_s3_bucket_website_configuration" "s3_bucket_website_configuration" {
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = "index.html"
  }
}

## Bucket policy
resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.allow_policy.json

  depends_on = [aws_s3_bucket_public_access_block.s3_bucket_public_access_block]
}

data "aws_iam_policy_document" "allow_policy" {
  statement {
    sid = "PublicReadGetObject"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${aws_s3_bucket.s3_bucket.arn}/*",
    ]
  }
}
