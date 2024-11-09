resource "aws_launch_template" "lt" {
  description = "launch template for future ec2"
  image_id = var.imageid
  instance_type = var.instancetype
  key_name = var.keyname
  vpc_security_group_ids = [var.sgid]
  user_data = base64encode(
    <<-EOF
    #!/bin/bash
    yum update
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Hello from Terraform!</h1>" > /var/www/html/index.html
    EOF
  )
}