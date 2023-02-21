resource "google_container_cluster" "gke-cluster" {
  name                     = "gke"
  location                 = "us-central1"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.main-vpc.name
  subnetwork               = google_compute_subnetwork.restricted.name
  logging_service          = "logging.googleapis.com/kubernetes"
  monitoring_service       = "monitoring.googleapis.com/kubernetes"

    addons_config {
        http_load_balancing {
      disabled = true
        }
    horizontal_pod_autoscaling {
      disabled = false
        }
  }

    workload_identity_config {
    workload_pool ="annular-haven-365520.svc.id.goog"
        }
    ip_allocation_policy {
    cluster_ipv4_cidr_block = "10.48.0.0/14"
    services_ipv4_cidr_block = "10.52.0.0/20"
        }        
    master_authorized_networks_config {
        cidr_blocks {
          cidr_block = "10.0.1.0/24"
        } 
    }
    private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "172.16.0.0/28"
        }

    release_channel {
	  channel = "STABLE"
    }
}
