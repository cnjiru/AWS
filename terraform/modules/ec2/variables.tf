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