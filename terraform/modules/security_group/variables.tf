variable "sg_name" {
  type = string
  description = "Security group name"
}
variable "vpc_id" {
  type        = string
  description = "ID of the VPC where security groups will be created"
}

variable "create_security_groups" {
  type    = bool
  default = true
}

variable "security_groups" {
  type = map(object({
    description = string
    ingress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    egress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  }))
  default = {}
}
