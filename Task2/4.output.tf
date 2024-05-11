# 6) Outpub file must show 1) Public IP, 2) VPC, 3) Subnet of the VM, 4) Internal IP of the VM.

output "task2_output" {
  value = {
    public_ip   = google_compute_instance.task2_instance.network_interface[0].access_config[0]
    vpc         = google_compute_network.task2_vpc.name
    subnet      = google_compute_subnetwork.brazilian_harem_subnet.name
    internal_ip = google_compute_instance.task2_instance.network_interface[0].network_ip
  }
}
