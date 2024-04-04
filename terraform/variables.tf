variable "instance_type" {
  description = "Instance type to be used"
  type        = string
  default = "t2.micro"
}
variable "nm_prefix" {
  description = "Prefix indicating the company or project"
  type        = string
}

variable "ec2_environment" {
  description = "Deployment environment (e.g., prod, staging, dev)"
  type        = string
}

variable "ec2_instance_count" {
  description = "Deployment environment (e.g., prod, staging, dev)"
  type        = number
  default = 1
}