# Create a publically accessible web page with Terraform.  You must complete the following
# 1) Terraform Script with a VPC
# 2) Terraform script must have a VM within your VPC.
# 3) The VM must have the homepage on it.
# 4) The VM must have an publically accessible link to it.
# 5) You must Git Push your script to your Github.
# 6) Outpub file must show 1) Public IP, 2) VPC, 3) Subnet of the VM, 4) Internal IP of the VM.


# add compute instance to the VPC
resource "google_compute_instance" "task2_instance" {
  name         = "task2vm"
  machine_type = "e2-medium"
  zone         = "us-east1-b"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 10
    }
    # true by default
    auto_delete = true
  }

  network_interface {
    network    = "task2-network"
    subnetwork = "task2-subnet"

    access_config {
      // Ephemeral public IP
    }
  }

  tags = ["http-server"]

  # metadata = {
  #   startup-script-url = "${file("startup.sh")}"
  # }

#   metadata_startup_script = file("startup.sh")

}


