resource "google_network_connectivity_multicloud_data_transfer_config" "network_connectivity_multicloud_data_transfer_configs" {
  for_each = var.network_connectivity_multicloud_data_transfer_configs

  location        = each.value.location
  name            = each.value.name
  deletion_policy = each.value.deletion_policy
  description     = each.value.description
  labels          = each.value.labels
  project         = each.value.project

  dynamic "services" {
    for_each = each.value.services != null ? each.value.services : []
    content {
      service_name = services.value.service_name
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

