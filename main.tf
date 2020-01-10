provider "aws" {
  region = "eu-west-2"
  profile = "default"
}

module "instance" {
  source = "./modules/instance"
  instance_key_name = "cfn-kp"
  instance_name = "tf-prj-instance"
}

output "instance_ip" {
  value = module.instance.instance_public_ip
}

