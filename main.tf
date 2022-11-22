
module "s3-cdn" {
  source = "./s3-cdn"

  bucket-name                = "bucketmaria834823648273"
  acl                        = "public-read"
  website_domain_name        = "maria-desafio-2-sust.daredelabs.com.br"
  locations                  = ["BR"]
  restri-type                = "whitelist"
  acm_certificate_arn_to_use = module.acm.certificate-arn
  tags                       = { "enviroment" = "test" }
  allowed_methods            = ["HEAD", "GET", "OPTIONS"]
  cached_methods             = ["GET", "HEAD"]
  minimum_protocol_version   = "TLSv1.2_2021"
  ssl_support_method         = "sni-only"
}

module "acm" {
  source = "./acm"

  zona-route53-name   = "daredelabs.com.br"
  website_domain_name = "maria-desafio-2-sust.daredelabs.com.br"
  tags                = { "enviroment" = "test" }
  cdn-domain-name     = module.s3-cdn.domain_name_cdn
  cdn-hosted-zone-id  = module.s3-cdn.hosted_zone_id

}