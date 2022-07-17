resource "aws_s3_bucket" "bucket_static" {
  bucket = var.bucket_name
  

}
resource "aws_s3_bucket_acl" "static_bucket_acl" {
  bucket = aws_s3_bucket.bucket_static.id
  acl = "public-read"
}


resource "aws_s3_object" "index_object" {
    bucket = aws_s3_bucket.bucket_static.id
    acl = "public-read"
    key = "index.html"
    source = "${path.module}/index.html"
    content_type = "text/html"

}

resource "aws_s3_object" "error_object" {
    bucket = aws_s3_bucket.bucket_static.id
    acl = "public-read"
    key = "error.html"
    source = "${path.module}/error.html"
    content_type = "text/html"

}


resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.bucket_static.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

}

