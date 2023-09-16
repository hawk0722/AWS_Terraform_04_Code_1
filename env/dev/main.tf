# 一般的な設定
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.project}-${var.env}-bucket-20230916-4"

  tags = {
    Name        = "${var.project}-${var.env}-s3"
    Environment = var.env
  }
}

# このバケットのブロックパブリックアクセス設定
resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# 静的ウェブサイトホスティング
resource "aws_s3_bucket_website_configuration" "s3_bucket_website_configuration" {
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = "index.html"
  }
}

# バケットポリシー
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
