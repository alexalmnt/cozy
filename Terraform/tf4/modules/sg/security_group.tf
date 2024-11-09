data "aws_vpc" "defaultvpc" {
  default = true

}

resource "aws_security_group" "sg1" {
  name        = "http+https"
  description = "allow http and https traffic"
  vpc_id      = data.aws_vpc.defaultvpc.id
}

resource "aws_vpc_security_group_ingress_rule" "sgingress1" {
  security_group_id = aws_security_group.sg1.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = var.httpport
  to_port           = var.httpport
}
resource "aws_vpc_security_group_ingress_rule" "sgingress2" {
  security_group_id = aws_security_group.sg1.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = var.httpsport
  to_port           = var.httpsport
}

resource "aws_vpc_security_group_egress_rule" "sgegress" {
  security_group_id = aws_security_group.sg1.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}