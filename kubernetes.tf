provider "google" {
 credentials ="/home/ankitsoni_570/concrete-crow-244606-95db70cb6ea9.json"
 project = "concrete-crow-244606"
 region = "us-central1"
}

resource "google_container_cluster" "primary" {
    name               = "ankit-gcp-poc"
    location           = "us-central1"
    initial_node_count = 1
    master_auth {
        username = ""
        password = ""
        client_certificate_config {
            issue_client_certificate = false
        }
    }

  node_config {
    preemptible  = true
    machine_type = "n1-standard-1"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
