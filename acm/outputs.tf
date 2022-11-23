output "certificate-arn" {
  value = aws_acm_certificate.cert.arn
}

output "www-record" {
  value = aws_route53_record.www_website_record.name
}

output "record" {
  value = aws_route53_record.website_cloudfront_record.name
}