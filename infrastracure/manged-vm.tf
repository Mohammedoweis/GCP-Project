resource "google_service_account" "serviceacc" {
  account_id   = "mo-gcpserviceaccount"
}

resource "google_project_iam_binding" "admin-role" {
  project = "iti-ow"
  role    = "roles/container.admin"

  members = [
    "serviceAccount:${google_service_account.serviceacc.email}",
  ]
}

resource "google_compute_instance" "manged-vm" {
  name         = "manged-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }

  } 
  network_interface {
    network  =  google_compute_network.main-vpc.name
    subnetwork   =  google_compute_subnetwork.mangment.name

  }
  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.serviceacc.email
    scopes = ["cloud-platform"]
  }
}
