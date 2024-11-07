// Provider block
provider "aws" {
  region  = var.region
  profile = "Monte"
}

// Creating Basic EC2 

resource "aws_instance" "awsintance" {
  ami           = var.ami_id
  instance_type = var.instance_type
}

