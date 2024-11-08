variable "instance_type" {
  description = "ec2 instance type"
  type        = string
}
variable "ami_id" {
  description = "the AMI ID for ec2 instances"
  type        = string
}
variable "region" {
  description = "the aws region"
  type        = string
}
variable "keyname" {
  description = "the key name for ec2"
  type        = string
}
