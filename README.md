

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