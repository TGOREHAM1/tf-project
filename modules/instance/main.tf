resource "aws_instance" "tf_prj_wp" {
  ami = data.aws_ssm_parameter.latest_ami.value
  instance_type = "t2.micro"
  key_name = var.instance_key_pair
  tags = {
      Name = var.instance_name
      Project = "tf-project"
  }
  vpc_security_group_ids = [
      var.security_groups
  ]
  user_data = file ("${path.module}/csa-ha-wp-bash.sh")
  iam_instance_profile = var.instance_profile
}

data "aws_ssm_parameter" "latest_ami" {
    name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}