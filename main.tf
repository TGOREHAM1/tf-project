provider "aws" {
  region = var.region
  profile = "default"
}

module "instance" {
  source = "./modules/instance"
  instance_key_pair = "cfn-kp"
  instance_name = "tf-prj-wp-blog"
}

module "bucket" {
  source = "./modules/bucket"
  region = var.region
}

output "instance_ip" {
  value = module.instance.instance_public_ip
}

output "instance_name" {
  value = module.instance.tags
}