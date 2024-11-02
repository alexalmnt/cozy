// Provider block
provider "aws" {
  region  = "us-east-1"
  profile = "Monte"
}
// terraform state file stored on S3 bucket
terraform {
  backend "s3" {
    bucket  = "terraform-backend1"
    key     = "terraform-backend1/backend/backend.tf"
    region  = "us-east-1"
    encrypt = true
  }
}
// Creating Basic EC2 
resource "aws_instance" "instance1" {
  ami           = "ami-06b21ccaeff8cd686"
  instance_type = var.instance_type
}