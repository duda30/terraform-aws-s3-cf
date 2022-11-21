module "s3-cdn" {
  source = "./s3-cdn"

  bucket-name                = "bucket-name-example"
  suffix-index-html          = "index.html"
  error-html                 = "error.html"
  acl                        = "public-read"
  website_domain_name        = "website-domain-name.com.br"
  locations                  = ["BR"]
  restri-type                = "whitelist"
  acm_certificate_arn_to_use = "arn:aws:acm:us-east-1:613036180535:certificate/f017c7cf-84d8-4f62-9d9b-fcd8622b3ca8"
  tags                       = { "enviroment" = "test" }
  allowed_methods            = ["GET", "OPTIONS", "DELETE"]
  cached_methods             = ["GET", "HEAD"]
  minimum_protocol_version   = "TLSv1.2_2021"
  ssl_support_method         = "sni-only"
}
