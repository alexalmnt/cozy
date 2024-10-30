resource "aws_instance" "vm1" {
  ami               = "ami-06b21ccaeff8cd686"
  availability_zone = "us-east-1b"
  instance_type     = "t2.micro"
  key_name          = "MacBook"
}

resource "aws_iam_user" "user1" {
  name = "terrauser"
}

resource "aws_iam_user" "user2" {
  name = "terrauser2"
}

resource "aws_iam_group" "group1" {
  name = "tfgroup"
}

resource "aws_iam_group_membership" "groupadd" {
  name = "tf-user_group_add"
  users = [  
    aws_iam_user.user1.name,
    aws_iam_user.user2.name
  ]
  group = aws_iam_group.group1.name
}