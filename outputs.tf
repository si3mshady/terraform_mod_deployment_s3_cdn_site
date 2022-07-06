output "s3_metadata" {
  value  = module.s3_site.s3_metadata.website_endpoint
}

output "cdn" {

    value = module.cloudfront.cdn_metadata.domain_name
  
}

