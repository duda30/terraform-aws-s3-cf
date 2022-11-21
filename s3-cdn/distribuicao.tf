resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.bucket-web.bucket_regional_domain_name
    origin_id   = local.enabled ? join("", aws_s3_bucket.bucket-web.*.id) : ""
  }

  enabled             = true
  default_root_object = "index.html"

  aliases = [local.website_bucket_name, local.www_website_bucket_name]

  default_cache_behavior {
    allowed_methods  = var.allowed_methods
    cached_methods   = var.cached_methods
    target_origin_id = local.enabled ? join("", aws_s3_bucket.bucket-web.*.id) : ""

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  ordered_cache_behavior {
    path_pattern     = "index.html"
    allowed_methods  = var.allowed_methods
    cached_methods   = var.cached_methods
    target_origin_id = local.enabled ? join("", aws_s3_bucket.bucket-web.*.id) : ""

    forwarded_values {
      query_string = false
      headers      = ["Origin"]

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }

  ordered_cache_behavior {
    path_pattern     = "/index.html"
    allowed_methods  = var.allowed_methods
    cached_methods   = var.cached_methods
    target_origin_id = local.enabled ? join("", aws_s3_bucket.bucket-web.*.id) : ""

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    compress               = true
    viewer_protocol_policy = "redirect-to-https"
  }


  restrictions {
    geo_restriction {
      restriction_type = var.restri-type
      locations        = var.locations
    }
  }
  tags = var.tags

  viewer_certificate {
    acm_certificate_arn            = var.acm_certificate_arn_to_use
    cloudfront_default_certificate = false
    minimum_protocol_version       = var.minimum_protocol_version
    ssl_support_method             = var.ssl_support_method
  }
}

locals {
  website_bucket_name     = var.website_domain_name
  www_website_bucket_name = "www.${var.website_domain_name}"
}

locals {
  enabled = true # bool
}