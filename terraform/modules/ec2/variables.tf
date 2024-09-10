variable "instance_type" {
  description = "Instance type to be used"
  type        = string
  default     = null
}

variable "ami_id" {
  description = "The AMI ID to use for the instance"
  type        = string
  default     = null
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 1 # default to 1 instance if not specified
}

variable "company_prefix" {
  description = "Prefix indicating the company or project"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., prod, staging, dev)"
  type        = string
}

variable "application" {
  description = "The application or service the instance is part of"
  type        = string
}

variable "role" {
  description = "The role of the instance (e.g., web, db, cache)"
  type        = string
}

variable "region" {
  description = "AWS region where the instance is deployed"
  type        = string
  default     = "us-east-1" # Set to your default region if needed
}

variable "securitygp" {
  type = string
  description = "ec2 sec group"
}
