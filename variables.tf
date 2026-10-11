variable "network_connectivity_multicloud_data_transfer_configs" {
  description = <<EOT
Map of network_connectivity_multicloud_data_transfer_configs, attributes below
Required:
    - location
    - name
Optional:
    - deletion_policy
    - description
    - labels
    - project
    - services (block):
        - service_name (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    location        = string
    name            = string
    deletion_policy = optional(string)
    description     = optional(string)
    labels          = optional(map(string))
    project         = optional(string)
    services = optional(list(object({
      service_name = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

