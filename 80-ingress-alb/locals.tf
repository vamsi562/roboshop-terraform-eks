locals {

  # bastion_sg = data.aws_ssm_parameter.bastion_sg.value
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Terraform   = true
  }
  common_name_suffix = "${var.project_name}-${var.environment}"
  ingress_alb_sg     = data.aws_ssm_parameter.ingress_alb_sg.value
  subnet_id          = split(",", data.aws_ssm_parameter.public_subnets.value)
  vpc_id             = data.aws_ssm_parameter.vpc_id.value
  zone_id            = data.aws_route53_zone.chikoo.zone_id
  acm_arn            = data.aws_ssm_parameter.ingress_alb_acm_arn.value
}
