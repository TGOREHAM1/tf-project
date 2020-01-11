resource "aws_s3_bucket" "static_website_bucket" {
    bucket = "tomgoreham.co.uk" 
}

resource "aws_s3_bucket" "wordpress_media_bucket" {
    bucket = "wordpress-tomgoreham-co-uk-media-bucket"
    tags = {
        Project = "tf-project"
    }
    region = var.region
    policy = templatefile("${path.module}/s3-public-access-pol.json", {
        media_bucket_arn = aws_s3_bucket.wordpress_media_bucket.arn
    })
}

resource "aws_s3_bucket" "wordpress_code_bucket" {
    bucket = "wordpress-tomgoreham-co-uk-code-bucket"
    tags = {
        Project = "tf-project"
    }
    region = var.region
}