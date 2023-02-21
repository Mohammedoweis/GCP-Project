resource "google_compute_firewall" "test-firewall" {
  name              = "test-firewall"
  network           = google_compute_network.main-vpc.name
  allow {
    protocol        = "tcp"
    ports           = ["22"]
  }
   source_ranges    = ["0.0.0.0/0"]
   
}