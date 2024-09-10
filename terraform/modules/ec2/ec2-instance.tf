# Create an EC2 instance within the fetched VPC
resource "aws_instance" "myec2" {
  count         = var.instance_count
  ami           = var.ami_id != null ? var.ami_id : data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  security_groups = [var.securitygp]
  key_name      = "test"

  # Associate the instance with the VPC's default subnet
  #subnet_id = tolist(data.aws_vpc.selected.subnets)[0]
  tags = {
    Name        = "${var.company_prefix}-${var.environment}-${var.application}-${var.role}-${format("%02d", count.index + 1)}"
    Environment = "stage"
  }

  user_data = <<-EOF
              #!/bin/bash
              # Update system
              sudo yum install -y wget
              sudo wget -O /etc/yum.repos.d/jenkins.repo \
                  https://pkg.jenkins.io/redhat/jenkins.repo
              sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io-2023.key
              sudo yum upgrade
              # Add required dependencies for the jenkins package
              sudo yum install fontconfig java-17-openjdk
              sudo yum install jenkins
              sudo systemctl enable jenkins
              sudo systemctl start jenkins
              EOF

}