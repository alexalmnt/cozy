variable "ami" {
  description = "Amazon Linux AMI ID"
  type        = string
}

variable "instance_type" {
  description = "instance type for ec2"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone for ec2"
  type        = string
}

variable "key_name" {
  description = "Key name for ec2"
  type        = string
}

variable "security_groups" {
  description = "security group for ec2"
  type        = list(string)
}

variable "instance_name" {
  description = "name of ec2"
  type        = string
}

variable "root_volume_size" {
  description = "storage volume for ec2"
  type        = number
}

variable "root_volume_type" {
  description = "type of root volume"
  type        = string
}