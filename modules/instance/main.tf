resource "aws_instance" "tf-prj-instance" {
  ami = data.aws_ssm_parameter.latest_ami.value
  instance_type = t2.micro
  key_name = var.instance_key_pair
  tags = {
      Name = var.instance_name
  }
}

data "aws_ssm_parameter" "latest_ami" {
    name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}