output "s3_metadata" {
  value = aws_s3_bucket.s3site
}

output "s3_files" {

    value = aws_s3_bucket_object.files
  
}

output "website_endpoint" {
    value = aws_s3_bucket.s3site.website_endpoint
}

output "regional_domain_name" {
    value = aws_s3_bucket.s3site.bucket_regional_domain_name
}