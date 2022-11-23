

   Esse módulo oferece a criação de um bucket S3 como site estático, uma distribuição no CloudFront, dois registros numa zona já existente no ROUTE53 e um certificado ACM com validação DNS, tudo com o backend remoto:

   ---------------------------------------------------------------------------------------

Exemplo de uso:

      terraform {
      required_providers {
         aws = {
            source  = "hashicorp/aws"
            version = "4.38.0"
         }
      }
      backend "s3" {
         bucket = "YOUR-bucket-name"
         key    = "YOUR-path/terraform.tfstate"
         region = "YOUR-bucket-region"
      }
      }

      provider "aws" {
      region = var.provider_region
      }

      module "s3-cdn" {
         source = "github.com/duda30/terraform-aws-s3-cf/tree/main/s3-cdn"

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
         source = "github.com/duda30/terraform-aws-s3-cf/tree/main/acm"

         zona-route53-name   = "daredelabs.com.br"
         website_domain_name = "maria-desafio-2-sust.daredelabs.com.br"
         tags                = { "enviroment" = "test" }
         cdn-domain-name     = module.s3-cdn.domain_name_cdn
         cdn-hosted-zone-id  = module.s3-cdn.hosted_zone_id
      }

   ---------------------------------------------------------------------------------------

ROOT:

   Variável:

   provider_region  | default = "us-east-1"
   

   Outputs:   

   website-domain-name-www | URL

   website-domain-name     | URL

   ---------------------------------------------------------------------------------------

Módulo ACM:

   GUIA DAS VARIÁVEIS:

      website_domain_name  | nome de domínio sem o "www" -> example.com.br | default = null

      tags                 | tags para os recursos                         | default = null

      zona-route53-name    | Nome da sua zona hospedada no Route53 AWS     | default = null

      cdn-domain-name      | O nome de domínio correspondente à distribuição, indicar obrigatoriamente -> cdn-domain-name = module.s3-cdn.domain_name_cdn     | default = null

      cdn-hosted-zone-id   | Alias para o registro no R53, indicar obrigatoriamente -> cdn-hosted-zone-id  = module.s3-cdn.hosted_zone_id     | default = null


   GUIA DOS OUTPUTS:

      certificate-arn      | ARN do certificado ACM 

      www-record           | Registro com "www" do Route53

      record               | Registro com "www" do Route53

   ---------------------------------------------------------------------------------------

Módulo S3-CDN:

   GUIA DAS VARIÁVEIS:

      bucket-name | é o nome do seu bucket | default = null

      acl         | acl do bucket          | default = "public-read"

      website_domain_name | nome de domínio sem o "www" -> example.com.br | default = null

      retri-type  | Tipo de restrição que deseja fazer no CloudFront      | default = "whitelist"

      locations   | locais para aplicar a restri-type                     | default = ["BR"]

      acm_certificate_arn_to_use | ARN do certificado na região us-east-1, indicar obrigatoriamente -> acm_certificate_arn_to_use = module.acm.certificate-arn      | default = null

      tags        | tags para os recursos                                 | default = null

      allowed_methods     | Métodos a serem permitidos no CloudFront      | default = null

      cached_methods      | Métodos de cache a serem permitidos no CloudFront | default = null

      minimum_protocol_version | A versão mínima do protocolo SSL que você deseja que o CloudFront use para conexões HTTPS | default = "TLSv1.2_2021"

      ssl_support_method  | Especifica como você deseja que o CloudFront atenda às solicitações HTTPS | default = "sni-only"

   GUIA DOS OUTPUTS:

      domain_name_cdn      | Nome de domínio correspondente à distribuição 

      hosted_zone_id       | Alias para o registro no R53 
