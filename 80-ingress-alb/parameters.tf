resource "aws_ssm_parameter" "ingress_alb_arn" {
  name  = "/${var.project_name}/${var.environment}/ingress_lb_listener_arn"
  type  = "String"
  value = aws_lb_listener.ingress_alb.arn
}
