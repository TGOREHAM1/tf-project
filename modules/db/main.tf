resource "aws_db_instance" "wp_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "nimda"
  password             = "aDm1n15tratOr"
  parameter_group_name = "default.mysql5.7"
  vpc_security_group_ids = [aws_security_group.rds_mysql_sg.id]
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
  source_security_group_id = var.source_sgs
  from_port = 3306
  to_port = 3306
  protocol = "tcp"
  security_group_id = aws_security_group.rds_mysql_sg.id 
}

resource "aws_security_group_rule" "allow_mysql_e" {
  type = "egress"
  description = "allows mysql access on port 3306"
  source_security_group_id = var.source_sgs
  from_port = 3306
  to_port = 3306
  protocol = "tcp"
  security_group_id = aws_security_group.rds_mysql_sg.id 
}