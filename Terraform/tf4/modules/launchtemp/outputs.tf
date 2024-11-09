output "launchtemp_id" {
  value = aws_launch_template.lt.id
}
output "launch_template_version" {
  value = aws_launch_template.lt.latest_version
}