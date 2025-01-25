terraform {
  required_version = ">=1.8.5"
required_providers {
   aws = {
      version = ">= 5.84.0"
      source = "hashicorp/aws"
    }
}

backend "s3" {
  bucket = "terraform-s3-bucket-sept-class"
  region = "ap-south-1"
  key = "terraform/ec2/terraform.tfstate"

  dynamodb_table = "dynamodb-terraform-backend" 
  encrypt = true

}
}