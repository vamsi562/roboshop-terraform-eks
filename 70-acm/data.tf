data "aws_route53_zone" "chikoo" {
  name         = "chikoo.fun"
  private_zone = false # Set to true if looking up a private hosted zone
}
