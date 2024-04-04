# Create an EC2 instance within the fetched VPC
resource "aws_instance" "myec2" {
  ami           = var.ami_id != null ? var.ami_id : data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  
  # Associate the instance with the VPC's default subnet
  #subnet_id = tolist(data.aws_vpc.selected.subnets)[0]
  tags = {
    Environment = "stage"
  }
}