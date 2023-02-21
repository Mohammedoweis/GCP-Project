resource "google_compute_router" "router" {
  name          = "my-router"
  region        = google_compute_subnetwork.mangment.region
  network       = google_compute_network.main-vpc.id

  bgp {
    asn             = 64514
    advertise_mode  ="CUSTOM"
  }
  
}

