output "instance_public_ip" {
  value = aws_instance.tf_prj_wp.public_ip
}

output "instance_public_dns" {
  value = aws_instance.tf_prj_wp.public_dns
}

output "tags" {
  value = aws_instance.tf_prj_wp.tags
}
