resource "aws_s3_bucket" "wordpress_media_bucket" {
    bucket = "wordpress-tomgoreham-co-uk-media-bucket"
    tags = {
        Project = "tf-project"
    }
    region = var.region
    policy = file("${path.module}/s3-public-access-pol.json")
}

resource "aws_s3_bucket" "wordpress_code_bucket" {
    bucket = "wordpress-tomgoreham-co-uk-code-bucket"
    tags = {
        Project = "tf-project"
    }
    region = var.region
}