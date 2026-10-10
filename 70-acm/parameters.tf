resource "aws_ssm_parameter" "ingress_alb" {
  name  = "/${var.project_name}/${var.environment}/ingress_alb_acm_arn"
  type  = "String"
  value = aws_acm_certificate.main.arn
}
