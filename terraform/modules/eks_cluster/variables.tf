variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the EKS cluster"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs to associate with the EKS cluster"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs to associate with the EKS cluster"
  type        = list(string)
}

variable "node_groups" {
  description = "Map of EKS node groups"
  type = map(object({
    desired_capacity = number
    max_size         = number
    min_size         = number
    instance_type    = string
    key_name         = string
    subnet_ids       = list(string)
  }))
  default = {}
}

variable "tags" {
  description = "A map of tags to add to resources"
  type        = map(string)
  default     = {}
}
