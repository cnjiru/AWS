
data "aws_vpc" "default" {
  default = true
}

module "myec2" {
  source         = "./modules/ec2"
  instance_type  = var.instance_type
  role           = "app"
  application    = "ecore"
  ami_id         = "ami-0583d8c7a9c35822c"
  company_prefix = var.nm_prefix
  environment    = var.ec2_environment
  securitygp     = module.security_groups.security_group_names[0]
}

# module "vpc" {
#   source = "./modules/vpc"

#   public_subnets = {
#     "public-1" = {
#       cidr_block        = "10.0.1.0/24"
#       availability_zone = "us-east-1a"
#     },
#     "public-2" = {
#       cidr_block        = "10.0.2.0/24"
#       availability_zone = "us-east-1b"
#     }
#   }

#   private_subnets = {
#     "private-1" = {
#       cidr_block        = "10.0.3.0/24"
#       availability_zone = "us-east-1a"
#     },
#     "private-2" = {
#       cidr_block        = "10.0.4.0/24"
#       availability_zone = "us-east-1b"
#     }
#   }
# }

module "security_groups" {
  source = "./modules/security_group"

  sg_name                = "jenkins-sg"
  vpc_id                 = data.aws_vpc.default.id
  create_security_groups = true

  security_groups = {
    "http_sg" = {
      description = "Allow HTTP traffic"
      ingress = [{
        from_port   = 22
        to_port     = 22
        protocol    = "SSH"
        cidr_blocks = ["0.0.0.0/0"]
      }]
      ingress = [{
        from_port   = 8080
        to_port     = 8080
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }]
      egress = [{
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }]
    }
  }
}



# module "eks" {
#   source = "./modules/eks_cluster"

#   cluster_name     = "my-eks-cluster"
#   region           = "us-east-1"
#   vpc_id           = module.vpc.vpc_id
#   public_subnet_ids = module.vpc.public_subnet_ids
#   private_subnet_ids = module.vpc.private_subnet_ids

#   node_groups = {
#     "worker-group-1" = {
#       desired_capacity = 1
#       max_size         = 1
#       min_size         = 0
#       instance_type    = "t3.micro"
#       key_name         = "cnjiru"
#       subnet_ids       = module.vpc.public_subnet_ids
#     },
#     "worker-group-2" = {
#       desired_capacity = 1
#       max_size         = 1
#       min_size         = 0
#       instance_type    = "t3.micro"
#       key_name         = "cnjiru"
#       subnet_ids       = module.vpc.private_subnet_ids
#     }
#   }

#   tags = {
#     Environment = "dev"
#   }
# }

