resource "google_compute_network" "main-vpc" {
  name                      = "main-vpc"
  auto_create_subnetworks   = false
  
}