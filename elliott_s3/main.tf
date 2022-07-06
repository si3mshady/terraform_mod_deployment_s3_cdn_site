
resource "aws_s3_bucket" "s3site" {
  bucket = var.bucket_name
  acl    = "public-read"
}

resource "aws_s3_bucket_website_configuration" "site_config" {
  bucket = aws_s3_bucket.s3site.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

resource "aws_s3_bucket_object" "files" {
  
  for_each = {
      html = "index.html"
      error = "error.html"
      image = "e.webp"
  }
  bucket = aws_s3_bucket.s3site.bucket
  content_type = "text/html"
  key    = each.value
  source = "${path.module}/${each.value}"
  acl = "public-read"

}

# https://www.terraform.io/language/meta-arguments/for_each
# https://stackoverflow.com/questions/72591497/terraform-error-opening-s3-bucket-object-source