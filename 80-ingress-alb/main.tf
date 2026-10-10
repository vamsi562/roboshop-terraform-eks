resource "aws_lb" "ingress_alb" {
  name               = "${local.common_name_suffix}-ingress-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [local.ingress_alb_sg]
  subnets            = local.subnet_id

  enable_deletion_protection = false

  tags = merge(local.common_tags,
    {
      Name = "${local.common_name_suffix}-ingress-alb"
    },
  )
}

resource "aws_lb_listener" "ingress_alb" {
  load_balancer_arn = aws_lb.ingress_alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-3-2021-06"
  certificate_arn   = local.acm_arn

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      message_body = "<h1> ingress alb resource response secure SSL </h1>"
      status_code  = "200"
    }
  }
}

resource "aws_route53_record" "ingress_alb" {
  zone_id = local.zone_id
  name    = "*.${var.domain_name}"
  type    = "A"

  alias {
    # these are backend alb zone details and dnsname
    name                   = aws_lb.ingress_alb.dns_name
    zone_id                = aws_lb.ingress_alb.zone_id
    evaluate_target_health = true
  }
}
