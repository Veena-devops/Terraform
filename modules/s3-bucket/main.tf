provider "aws" {
  region = var.region
}
resource "aws_s3_bucket" "terraform_s3_module" {
  #bucket = "terraform-demo-bucket1"
  bucket = var.bucket
  tags   = var.tags
}
