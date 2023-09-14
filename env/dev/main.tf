resource "aws_s3_bucket" "s3" {
  bucket = "${var.project}-${var.env}-bucket-20230915"

  tags = {
    Name        = "My bucket"
    Environment = var.env
  }
}
