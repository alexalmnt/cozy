output "instance_id" {
  description = "the id of the ec2 instance"
  value       = aws_instance.awsintance.id
}
output "name" {
  description = "name of the ec2"
  value = aws_instance.awsintance.tags
}
