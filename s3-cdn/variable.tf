variable "bucket-name" {
  description = "nome do bucket"
  default     = null
}

variable "acl" {
  description = "acl do bucket"
  default     = "public-read"
}

variable "suffix-index-html" {
  default = null
}

variable "error-html" {
  default = null
}

variable "website_domain_name" {
  description = "Domínio -> example.com.br - do seu site"
  default     = null
}

variable "restri-type" {
  description = "Tipo de restrição que você quer"
  default     = "whitelist"
}

variable "locations" {
  description = "Locais que você deseja (liberar -> restri-type = whitelist) ou (bloquear -> restri-type=blacklist) o acesso ao site"
  type        = list(string)
  default     = ["BR"]
}

variable "acm_certificate_arn_to_use" {
  description = "O certificado deve estar obrigatoriamente na região us-east-1"
  type        = string
  default     = null
}

variable "tags" {
  type    = map(string)
  default = null
}

variable "allowed_methods" {
  description = "Métodos permitidos sendo DELETE, GET, HEAD, OPTIONS, PATCH, POST ou PUT"
  type        = list(string)
  default     = null
}

variable "cached_methods" {
  description = "Métodos para cache sendo GET e HEAD as opções"
  type        = list(string)
  default     = null
}

variable "minimum_protocol_version" {
  default = "TLSv1.2_2021"
}

variable "ssl_support_method" {
  default = "sni-only"
}
