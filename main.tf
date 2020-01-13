provider "aws" {
  region = var.region
  profile = "default"
}

resource "aws_route53_record" "tomgoreham_co_uk" {
  zone_id = "Z35CLHFG2ULC3O"
  name = "www.tomgoreham.co.uk"
  type = "A"
  ttl = 300
  records = [module.instance.instance_public_ip]  
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