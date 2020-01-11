resource "aws_iam_instance_profile" "instance_profile" {
    role = aws_iam_role.s3_for_wp_role.name  
}

resource "aws_iam_role" "s3_for_wp_role" {
  name = "s3-for-wp-role"
  description = "iam role for ec2 to access s3"
  tags = {
      Project = "tf-project"
  }
  assume_role_policy = data.aws_iam_policy_document.instance_trust_policy.json
}

resource "aws_iam_role_policy" "s3_for_wp_role_pol" {
    policy = file("${path.module}/s3-public-access-pol.json")
    role = aws_iam_role.s3_for_wp_role.id
}

data "aws_iam_policy_document" "instance_trust_policy" {
  statement {
      effect = "Allow"
      actions = ["sts:AssumeRole"]
      principals {
          type = "Service"
          identifiers = ["ec2.amazonaws.com"]
      }
  }
}
