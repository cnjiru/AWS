# Data source to fetch the latest Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Use AMIs owned by Amazon
}

# Data source to fetch the VPC ID
data "aws_vpc" "selected" {
  tags = {
    Name = "default"
  }
}