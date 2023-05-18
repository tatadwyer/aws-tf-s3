resource "aws_s3_bucket" "replica_nf_bucket" {
  bucket = "replica-nf-bucket"
}

resource "aws_iam_user" "nf_user" {
  name = "nf-user"
}

resource "aws_iam_policy" "nf_user_policy" {
  name        = "nf-user-policy"
  description = "Policy that allows nf-user to upload to replica-nf-bucket"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "s3:PutObject",
          "s3:PutObjectAcl",
          "s3:GetBucketLocation"
        ],
        Resource = "${aws_s3_bucket.replica_nf_bucket.arn}/*"
      },
    ]
  })
}

resource "aws_iam_policy_attachment" "nf_user_policy_attachment" {
  name       = "nf-user-policy-attachment"
  policy_arn = aws_iam_policy.nf_user_policy.arn
  users      = [aws_iam_user.nf_user.name]
}

#Bucket para depositar notas fiscais