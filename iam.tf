resource "aws_iam_role" "ec2-role" {
  name = "ec2-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

data "aws_iam_policy" "S3ReadOnlyAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "s3-read-role-policy-attach" {
  role = aws_iam_role.ec2-role.name
  policy_arn = data.aws_iam_policy.S3ReadOnlyAccess.arn
}

resource "aws_iam_instance_profile" "profile" {
  name = "my-profile"
  role = aws_iam_role.ec2-role.name
}