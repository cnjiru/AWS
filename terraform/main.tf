module "myec2" {
    source = "./modules/ec2"
    instance_type = var.instance_type
    role            = "app"
    application     = "ecore"
    company_prefix = var.nm_prefix
    environment    = var.ec2_environment
}
