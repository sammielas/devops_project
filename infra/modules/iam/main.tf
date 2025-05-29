resource "aws_iam_role" "s3_access_role" {
  name = "EKS_S3AccessRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = module.eks.cluster_iam_role_arn
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name        = "EKS_S3AccessRole"
    Environment = var.environment
  }
}


resource "aws_iam_policy" "s3_policy" {
  name        = "S3FullAccessPolicy"
  description = "Grant full access to S3 bucket"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket"
        ]
        Resource = [
          "arn:aws:s3:::fintech-app-sammielas-bucket",
          "arn:aws:s3:::fintech-app-sammielas-bucket/*"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_s3_policy" {
  role       = aws_iam_role.s3_access_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}


resource "aws_iam_role" "eks_nodes_role" {
  name = "EKSNodesRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name        = "EKSNodesRole"
    Environment = var.environment
  }
}


resource "aws_iam_role_policy_attachment" "attach_s3_to_nodes" {
  role       = aws_iam_role.eks_nodes_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}
