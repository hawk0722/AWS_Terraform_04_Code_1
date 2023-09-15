resource "aws_s3_bucket" "s3" {
  bucket = "${var.project}-${var.env}-bucket-20230915"

  tags = {
    Name        = "${var.project}-${var.env}-s3"
    Environment = var.env
  }
}
