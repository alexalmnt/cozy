data "aws_subnet" "subnet1" {
  id = "subnet-01fcffd3122ca5d1b"
}
data "aws_subnet" "subnet2" {
  id = "subnet-0524572a463140c93"
}
resource "aws_autoscaling_group" "asg" {
  name = var.asgname
  max_size = var.max
  min_size = var.min
  desired_capacity = var.desired
  vpc_zone_identifier = [ data.aws_subnet.subnet1.id, data.aws_subnet.subnet2.id ]
  launch_template {
    id = var.launch_temp_id
    version = var.launch_version
  }
}