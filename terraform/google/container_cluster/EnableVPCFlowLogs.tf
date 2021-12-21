# fails
# CKV_GCP_13: "Ensure a client certificate is used by clients to authenticate to Kubernetes Engine Clusters"
# CKV_GCP_68: "Ensure Secure Boot for Shielded GKE Nodes is Enabled"
# CKV_GCP_65: "Manage Kubernetes RBAC users with Google Groups for GKE"
# CKV_GCP_66: "Ensure use of Binary Authorization"
# CKV_GCP_21: "Ensure Kubernetes Clusters are configured with Labels"
# CKV_GCP_71: "Ensure Shielded GKE Nodes are Enabled"
# CKV_GCP_67: "Ensure legacy Compute Engine instance metadata APIs are Disabled"
# CKV_GCP_61: "Enable VPC Flow Logs and Intranode Visibility"

resource "google_container_cluster" "fail-flowlogs" {
  name               = var.name
  location           = var.location
  initial_node_count = 1
  project            = data.google_project.project.name

  network    = var.network
  subnetwork = var.subnetwork

  ip_allocation_policy {
    cluster_ipv4_cidr_block       = var.ip_allocation_policy["cluster_ipv4_cidr_block"]
    cluster_secondary_range_name  = var.ip_allocation_policy["cluster_secondary_range_name"]
    services_ipv4_cidr_block      = var.ip_allocation_policy["services_ipv4_cidr_block"]
    services_secondary_range_name = var.ip_allocation_policy["services_secondary_range_name"]
  }

  remove_default_node_pool = var.remove_default_node_pool

  min_master_version = "1.12"

  node_config {
    workload_metadata_config {
      # node_metadata = "GKE_METADATA_SERVER"
    }
    shielded_instance_config {
      enable_integrity_monitoring = true
      enable_secure_boot          = true
    }
  }

  release_channel {
    channel = var.release_channel
  }

  master_auth {

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  addons_config {
    http_load_balancing {
      disabled = var.http_load_balancing_disabled
    }

    network_policy_config {
      disabled = var.network_policy_config_disabled
    }
  }

  maintenance_policy {
    daily_maintenance_window {
      start_time = var.maintenance_window
    }
  }

  private_cluster_config {
    enable_private_nodes    = var.private_cluster_config["enable_private_nodes"]
    enable_private_endpoint = var.private_cluster_config["enable_private_endpoint"]
    master_ipv4_cidr_block  = var.private_cluster_config["master_ipv4_cidr_block"]
  }

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = var.master_authorized_network_cidr
    }
  }

  network_policy {
    enabled = true
  }

  pod_security_policy_config {
    enabled = var.pod_security_policy_config_enabled
  }

  resource_labels = var.resource_labels
}
