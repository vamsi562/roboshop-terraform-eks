module "sg" {
  count        = length(var.sg_name)
  source       = "git::https://github.com/vamsi562/terraform-module-sg.git?ref=main"
  sg_name      = var.sg_name[count.index]
  description  = "created for ${var.sg_name[count.index]}"
  project_name = var.project_name
  environment  = var.environment
  vpc_id       = local.vpc_id
}
