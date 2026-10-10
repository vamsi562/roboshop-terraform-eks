locals {

  # bastion_sg = data.aws_ssm_parameter.bastion_sg.value
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Terraform   = true
  }
  common_name_suffix   = "${var.project_name}-${var.environment}"
  ingress_alb_sg       = data.aws_ssm_parameter.ingress_alb_sg.value
  subnet_id            = split(",", data.aws_ssm_parameter.private_subnets.value)
  vpc_id               = data.aws_ssm_parameter.vpc_id.value
  acm_arn              = data.aws_ssm_parameter.ingress_alb_acm_arn.value
  eks_node_sg          = data.aws_ssm_parameter.eks_node_group_sg.value
  eks_control_plane_sg = data.aws_ssm_parameter.eks_control_plane_sg.value
}
