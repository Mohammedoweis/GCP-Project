resource "google_compute_subnetwork" "mangment" {
  name          = "mangment"
  network       = google_compute_network.main-vpc.id
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
}

##************************************************************#

resource "google_compute_subnetwork" "restricted" {
  name                     = "restricted"
  ip_cidr_range            = "10.0.0.0/24"
  region                   = "us-central1"
  network                  = google_compute_network.main-vpc.id


}

