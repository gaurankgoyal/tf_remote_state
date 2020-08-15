resource "aws_s3_bucket" "remote_state" {
  bucket        = "${var.prefix}-remote-state-${var.environment}"
  acl           = "authenticated-read"
  force_destroy = false
  # Never want to delete your state bucket

  lifecycle {
    prevent_destroy = false
  }

  versioning {
    enabled = true
  }

  tags = {
    Name        = "${var.prefix}-remote-state-${var.environment}"
    Environment = var.environment
  }
}

