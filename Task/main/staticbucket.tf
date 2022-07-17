module "static_bucket" {
    source = "../module_bucket"
    bucket_name = var.bucket_name
}

output "website_endpoint" {
  value = module.static_bucket.endpoint
}