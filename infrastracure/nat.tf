resource "google_compute_router_nat" "nat01" {
  name                               = "nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = "mangment"
    source_ip_ranges_to_nat = ["10.0.1.0/24"]
  }
   subnetwork {
    name                    = "restricted"
    source_ip_ranges_to_nat = ["10.0.0.0/24"]
  }


}
