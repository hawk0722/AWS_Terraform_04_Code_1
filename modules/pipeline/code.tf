# CodeCommit
## General configuration
resource "aws_codecommit_repository" "repo" {
  repository_name = "${var.project}-${var.env}-repo"
  description     = "This is the Sample App Repository"

  tags = {
    Name        = "${var.project}-${var.env}-repo"
    Environment = var.env
  }
}
