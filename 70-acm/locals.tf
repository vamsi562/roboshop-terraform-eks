locals {
  common_tags = {
    Project     = var.project_name
    Environment = var.environment
    Terraform   = true
  }
  common_name_suffix = "${var.project_name}-${var.environment}"
  zone_id            = data.aws_route53_zone.chikoo.zone_id
}
