output "bucket_url" {
  value = "https://storage.googleapis.com/my-website-bucket-1234567890/index.html${google_storage_bucket.sniggle-snaggle-bucket.name}/index.html"
}
