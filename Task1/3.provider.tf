terraform {
    required_providers {
        google = {
            source  = "hashicorp/google"
            version = "5.27.0"
        }
    }
}

provider "google" {
    project     = "sanguine-frame-416401"
    region      = "us-east1"
    zone       = "us-east1-b"
    credentials = "sanguine-frame-416401-511d9ec39887.json"
}