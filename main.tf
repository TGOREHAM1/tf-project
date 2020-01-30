provider "aws" {
  region = var.region
  profile = "default"
}

data "aws_route53_zone" "tomgoreham_co_uk" {
  name         = "tomgoreham.co.uk."
}
#Z35CLHFG2ULC3O
resource "aws_route53_record" "tomgoreham_co_uk_a" {
  zone_id = data.aws_route53_zone.tomgoreham_co_uk.zone_id
  name = "www.tomgoreham.co.uk"
  type = "A"
  ttl = 300
  records = [module.instance.instance_public_ip]  
}

resource "aws_route53_record" "tomgoreham_co_uk_cname" {
  zone_id = data.aws_route53_zone.tomgoreham_co_uk.zone_id
  name = "www.tomgoreham.co.uk"
  type = "CNAME"
  ttl = 300
  records = ["${module.instance.instance_public_dns}"]
}

module "instance" {
  source = "./modules/instance"
  instance_key_pair = "cfn-kp"
  instance_name = "tf-prj-wp-blog"
  instance_profile = module.iam.instance_profile.name
  security_groups = "${module.security_group.ssh_security_group_id}, ${module.security_group.https_security_group_id}, ${module.security_group.ec2_mysql_security_group_id}"
}

module "bucket" {
  source = "./modules/bucket"
  region = var.region
}

module "db" {
  source = "./modules/db"
  source_sgs = module.security_group.https_security_group_id
}

module "security_group" {
  source = "./modules/security_group"
  source_sgs = module.db.rds_mysql_sg_id
}

module "iam" {
  source = "./modules/iam"
}

output "instance_ip" {
  value = module.instance.instance_public_ip
}

output "instance_name" {
  value = module.instance.tags
}