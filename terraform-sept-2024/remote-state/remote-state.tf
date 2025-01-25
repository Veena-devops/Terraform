provider "aws" {
    region = "ap-south-1"
}

resource "aws_s3_bucket" "terraform-s3" {
  bucket = "terraform-s3-bucket-sept-class"
  force_destroy = true
  tags = {
    Name        = "Terraform-s3-backend"
  }
}
  resource "aws_s3_bucket_versioning" "terraform-s3-versioning" {
  bucket = aws_s3_bucket.terraform-s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform-dynamodb" {
  name           = "dynamodb-terraform-backend"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"


  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "dynamodb-table-backend"
  }
}