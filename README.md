

   Esse módulo oferece a criação de um bucket S3 como site estático e o serviço CloudFront:

   ---------------------------------------------------------------------------------------

   GUIA DAS VARIÁVEIS:

   bucket-name | é o nome do seu bucket | default = null

   tags        | tags para os recursos  | default = null

   acl         | acl do bucket          | default = "public-read"

   website_domain_name | nome de domínio sem o "www" -> example.com.br | default = null

   retri-type  | Tipo de restrição que deseja fazer no CloudFront      | default = "whitelist"

   locations   | locais para aplicar a restri-type                     | default = ["BR"]

   acm_certificate_arn_to_use | ARN do certificado na região us-east-1 | default = null

   allowed_methods     | Métodos a serem permitidos no CloudFront      | default = null

   cached_methods      | Métodos de cache a serem permitidos no CloudFront | default = null

   minimum_protocol_version | A versão mínima do protocolo SSL que você deseja que o CloudFront use para conexões HTTPS | default = "TLSv1.2_2021"

   ssl_support_method   | Especifica como você deseja que o CloudFront atenda às solicitações HTTPS | default = "sni-only"

   zona-route53-name    | Nome da sua zona hospedada no Route53 AWS | default = null

   cdn-domain-name      | O nome de domínio correspondente à distribuição, indicar obrigatoriamente -> cdn-domain-name = module.s3-cdn.domain_name_cdn | default = null

   cdn-hosted-zone-id   | Alias para o registro no R53, indicar obrigatoriamente -> cdn-hosted-zone-id  = module.s3-cdn.hosted_zone_id | default = null