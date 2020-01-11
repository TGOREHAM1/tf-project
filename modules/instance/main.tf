resource "aws_instance" "tf_prj_jump_box" {
  ami = data.aws_ssm_parameter.latest_ami.value
  instance_type = "t2.micro"
  key_name = var.instance_key_pair
  tags = {
      Name = var.instance_name
      Project = "tf-project"
  }
  vpc_security_group_ids = [
      module.security_group.ssh_security_group_id,
      module.security_group.https_security_group_id
  ]
  user_data = file ("${path.module}/csa-ha-wp-bash.sh")
  iam_instance_profile = module.iam.instance_profile.name
}

module "security_group" {
  source = "/Users/tomg/Documents/tf-project/modules/security_group"
}

module "iam" {
  source = "/Users/tomg/Documents/tf-project/modules/iam"
}

data "aws_ssm_parameter" "latest_ami" {
    name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}