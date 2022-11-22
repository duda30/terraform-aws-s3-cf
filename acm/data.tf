data "aws_route53_zone" "zona-route53" {
  name         = var.zona-route53-name
  private_zone = false
}

