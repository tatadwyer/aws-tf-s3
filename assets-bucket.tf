resource "aws_s3_bucket" "replica_assets_bucket" {
  bucket = "replica-assets-bucket"
}

resource "aws_iam_user" "assets_user" {
  name = "assets-user"
}

resource "aws_iam_policy" "assets_user_policy" {
  name        = "assets-user-policy"
  description = "Policy that allows assets-user to download from replica-assets-bucket"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "s3:GetObject",
        Resource = "${aws_s3_bucket.replica_assets_bucket.arn}/*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "assets_user_policy_attachment" {
  name       = "assets-user-policy-attachment"
  policy_arn = aws_iam_policy.assets_user_policy.arn
  users      = [aws_iam_user.assets_user.name]
}

#Bucket de onde cliente irá acessar assets