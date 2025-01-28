resource "aws_dynamodb_table" "terraform-dynamodb" {
  name           = "var.name"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"


  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "dynamodb-table-backend"
  }
}
