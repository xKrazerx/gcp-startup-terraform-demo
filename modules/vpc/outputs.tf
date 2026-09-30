output "network_id" { value = google_compute_network.vpc.id }
output "network_name" { value = google_compute_network.vpc.name }
output "subnet_id" { value = google_compute_subnetwork.main.id }
output "peering_connection" { value = google_service_networking_connection.private_vpc_connection.id }
