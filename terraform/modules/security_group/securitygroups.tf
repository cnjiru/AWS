resource "aws_security_group" "sg" {
  count       = var.create_security_groups ? length(var.security_groups) : 0
  vpc_id      = var.vpc_id
  description = element(values(var.security_groups), count.index).description

  dynamic "ingress" {
    for_each = element(values(var.security_groups), count.index).ingress
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = element(values(var.security_groups), count.index).egress
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = {
    Name = element(keys(var.security_groups), count.index)
  }
}
