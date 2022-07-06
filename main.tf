
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
#   s3_bucket = module.s3_site
}