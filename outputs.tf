output "website-domain-name-www" {
  value = "https://${module.acm.www-record}/"
}

output "website-domain-name" {
  value = "https://${module.acm.record}/"
}