# Create a Google VPC 
resource "google_compute_network" "task2_vpc" {
  project                 = "sanguine-frame-416401"
  name                    = "task2-network"
  auto_create_subnetworks = false
  mtu                     = 1460
}

# add subnet to the VPC
resource "google_compute_subnetwork" "brazilian_harem_subnet" {
  name          = "task2-subnet"
  ip_cidr_range = "10.10.0.0/24"
  region        = "us-east1"
  network       = google_compute_network.task2_vpc.id
}

# firewall rule to allow traffic on port 80
resource "google_compute_firewall" "firewall_rules" {
  name    = "you-shall-not-pass"
  network = google_compute_network.task2_vpc.id

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
  priority      = 1000
}
