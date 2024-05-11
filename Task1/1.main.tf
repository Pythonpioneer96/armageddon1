# Create a publically accesible bucket in GCP with Terraform.  You must complete the following tasks.
# 1) Terraform script
# 2) Git Push the script to your Github
# 3) Output file must show the public link
# 4) Must have an index.html file within

resource "google_storage_bucket" "sniggle-snaggle-bucket" {
  name          = "my-website-bucket-1234567890"
  location      = "us-east1"
  force_destroy = true
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
  # cors {
  #   origin          = ["http://image-store.com"]
  #   method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
  #   response_header = ["*"]
  #   max_age_seconds = 3600
  # }
  uniform_bucket_level_access = false
}


resource "google_storage_bucket_access_control" "public_rule" {
  bucket = google_storage_bucket.sniggle-snaggle-bucket.name
  role   = "READER"
  entity = "allUsers"
}

resource "google_storage_bucket_iam_binding" "public_access" {
  bucket = google_storage_bucket.sniggle-snaggle-bucket.name
  role   = "roles/storage.objectViewer"

  members = [
    "allUsers",
  ]
}

resource "google_storage_bucket_object" "default" {
  name         = "index.html"
  source       = "public/index.html"
  content_type = "text/html"
  bucket       = google_storage_bucket.sniggle-snaggle-bucket.id
}

