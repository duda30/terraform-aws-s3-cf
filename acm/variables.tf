variable "website_domain_name" {
  default = null
}

variable "tags" {
  type    = map(string)
  default = null
}

variable "zona-route53-name" {
  description = "Nome da sua zona hospedada no Route53 AWS"
  default     = null
}

variable "cdn-domain-name" {
  description = "Nome de domínio correspondente à distribuição"
  default     = null
}

variable "cdn-hosted-zone-id" {
  description = "Alias para o registro no R53"
  default     = null
}


