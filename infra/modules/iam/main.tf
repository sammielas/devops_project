

# 1. Define the IAM policy
resource "aws_iam_policy" "eks_cluster_admin" {
  name        = "${var.cluster_name}-admin-policy"
  description = "Provides admin access to EKS cluster ${var.cluster_name}"
  policy      = data.aws_iam_policy_document.eks_cluster_admin.json
}

data "aws_iam_policy_document" "eks_cluster_admin" {
  statement {
    sid    = "EKSClusterReadAccess"
    effect = "Allow"
    actions = [
      "eks:DescribeCluster",
      "eks:ListClusters",
      "eks:ListNodegroups",
      "eks:AccessKubernetesApi"
    ]
    resources = [module.eks.cluster_arn]
  }

  statement {
    sid    = "EKSAuthConfig"
    effect = "Allow"
    actions = [
      "eks:DescribeUpdate",
      "eks:ListUpdates"
    ]
    resources = ["*"]
  }
}

# 2. Attach to IAM users/roles
resource "aws_iam_user_policy_attachment" "eks_admins" {
  for_each = toset(var.eks_admin_users)

  user       = each.key
  policy_arn = aws_iam_policy.eks_cluster_admin.arn
}

 
