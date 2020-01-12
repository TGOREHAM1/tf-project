resource "aws_security_group" "ssh_sg" {
  name = "sec-grp-ssh"
  description = "security group to allow ssh access to the resource"
  tags = {
    Project = "tf-project"
  }
}

resource "aws_security_group_rule" "allow_ssh" {
  type = "ingress"
  description = "allows ssh access on port 22"
  cidr_blocks = ["88.98.242.130/32"]
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = aws_security_group.ssh_sg.id
}


resource "aws_security_group" "https_sg" {
  name = "sec-grp-https"
  description = "security group to allow http access to the resource"
  tags = {
    Project = "tf-project"
  }
}

resource "aws_security_group_rule" "allow_http_i" {
  type = "ingress"
  description = "allows http access on port 80"
  cidr_blocks = ["0.0.0.0/0"]
  from_port = 80
  to_port = 80
  protocol = "tcp"
  security_group_id = aws_security_group.https_sg.id
}

resource "aws_security_group_rule" "allow_https_i" {
  type = "ingress"
  description = "allows https access on port 443"
  cidr_blocks = ["0.0.0.0/0"]
  from_port = 443
  to_port = 443
  protocol = "tcp"
  security_group_id = aws_security_group.https_sg.id
}

resource "aws_security_group_rule" "allow_http_e" {
  type = "egress"
  description = "allows http access on port 80"
  cidr_blocks = ["0.0.0.0/0"]
  from_port = 80
  to_port = 80
  protocol = "tcp"
  security_group_id = aws_security_group.https_sg.id
}

resource "aws_security_group_rule" "allow_https_e" {
  type = "egress"
  description = "allows https access on port 443"
  cidr_blocks = ["0.0.0.0/0"]
  from_port = 443
  to_port = 443
  protocol = "tcp"
  security_group_id = aws_security_group.https_sg.id
}

resource "aws_security_group" "rds_mysql_sg" {
  name = "sec-grp-mysql"
  description = "security group to allow access on port 3306"
  tags = {
    Project = "tf-project"
  }
}

resource "aws_security_group_rule" "allow_mysql_i" {
  type = "ingress"
  description = "allows mysql access on port 3306"
  source_security_group_id = aws_security_group.https_sg.id
  from_port = 3306
  to_port = 3306
  protocol = "tcp"
  security_group_id = aws_security_group.rds_mysql_sg.id 
}

resource "aws_security_group_rule" "allow_mysql_e" {
  type = "egress"
  description = "allows mysql access on port 3306"
  source_security_group_id = aws_security_group.https_sg.id
  from_port = 3306
  to_port = 3306
  protocol = "tcp"
  security_group_id = aws_security_group.rds_mysql_sg.id 
}