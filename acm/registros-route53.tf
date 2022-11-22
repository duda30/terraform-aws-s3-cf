locals {
  website_bucket_name     = var.website_domain_name
  www_website_bucket_name = "www.${var.website_domain_name}"
}


resource "aws_route53_record" "website_cloudfront_record" {

  zone_id = data.aws_route53_zone.zona-route53.id
  name    = local.website_bucket_name
  type    = "A"
  alias {
    name                   = var.cdn-domain-name
    zone_id                = var.cdn-hosted-zone-id
    evaluate_target_health = true
  }

}

resource "aws_route53_record" "www_website_record" {

  zone_id = data.aws_route53_zone.zona-route53.id
  name    = local.www_website_bucket_name
  type    = "A"
  alias {
    name                   = var.cdn-domain-name
    zone_id                = var.cdn-hosted-zone-id
    evaluate_target_health = true
  }
}