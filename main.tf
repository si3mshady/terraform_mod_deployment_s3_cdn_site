
provider "aws" {

  region     = local.aws_region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    
    }
  }
}

locals {
  bucket_name = "elliott-s3-tf-test-site"
  aws_region = "us-west-2"
}


module "s3_site" {
  source = "./elliott_s3"
  bucket_name = local.bucket_name
 
}

module "cloudfront" {

  source = "./elliott_cloudfront"
  website_endpoint = module.s3_site.website_endpoint
  bucket_name = local.bucket_name
  regional_domain_name = module.s3_site.regional_domain_name
}


output "s3_metadata" {
  value  = module.s3_site.s3_metadata.website_endpoint
}

output "cdn" {

    value = module.cloudfront.cdn_metadata.domain_name
  
}




