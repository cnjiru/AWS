output "eks_cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "eks_cluster_arn" {
  value = aws_eks_cluster.eks.arn
}

output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "node_group_names" {
  value = keys(aws_eks_node_group.node_groups)
}
