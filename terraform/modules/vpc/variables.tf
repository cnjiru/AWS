variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
  default     = "main-vpc"
}

variable "vpc_cidr" {
  type        = string
  description = "vpc cidr"
  default     = "10.0.0.0/16"
}

variable "private_subneta_vailability_zone" {
  type        = list(string)
  description = "Availability zones for public subnets"
  default     = ["us-east-1a"]
}

variable "public_subneta_vailability_zone" {
  type        = list(string)
  description = "Availability zones for private subnets"
  default     = ["us-east-1a"]
}

variable "public_subnets" {
  description = "Map of public subnets to create"
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}

variable "private_subnets" {
  description = "Map of private subnets to create"
  type = map(object({
    cidr_block        = string
    availability_zone = string
  }))
}
