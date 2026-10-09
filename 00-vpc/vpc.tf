module "vpc" {
  # source                = "../modules/vpc"
  #source                = "git::https://github.com/vamsi562/terraform-modules-vpc.git?ref=<branch>"
  source                = "git::https://github.com/vamsi562/terraform-modules-vpc.git//vpc"
  cidr_block            = var.cidr_block
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
  database_subnet_cidrs = var.database_subnet_cidrs
  project_name          = var.project_name
  environment           = var.environment
  peering_status        = var.peering_status
}
