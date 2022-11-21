resource "aws_s3_bucket_website_configuration" "bucket-web-config" {
  bucket = aws_s3_bucket.bucket-web.bucket

  index_document {
    suffix = var.suffix-index-html
  }

  error_document {
    key = var.error-html
  }
}

