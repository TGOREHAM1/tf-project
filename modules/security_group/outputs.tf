output "ssh_security_group_id" {
  value = aws_security_group.ssh_sg.id
}

output "https_security_group_id" {
  value = aws_security_group.https_sg.id
}

output "ec2_mysql_security_group_id" {
  value = aws_security_group.ec2_mysql_sg.id
}