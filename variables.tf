variable "batch_pools" {
  description = <<EOT
Map of batch_pools, attributes below
Required:
    - account_name
    - name
    - node_agent_sku_id
    - resource_group_name
    - vm_size
    - storage_image_reference (block):
        - id (optional)
        - offer (optional)
        - publisher (optional)
        - sku (optional)
        - version (optional)
Optional:
    - display_name
    - inter_node_communication
    - license_type
    - max_tasks_per_node
    - metadata
    - os_disk_placement
    - stop_pending_resize_operation
    - target_node_communication_mode
    - auto_scale (block):
        - evaluation_interval (optional)
        - formula (required)
    - certificate (block):
        - id (required)
        - store_location (required)
        - store_name (optional)
        - visibility (optional)
    - container_configuration (block):
        - container_image_names (optional)
        - container_registries (optional, block):
            - password (optional)
            - registry_server (optional)
            - user_assigned_identity_id (optional)
            - user_name (optional)
        - type (optional)
    - data_disks (block):
        - caching (optional)
        - disk_size_gb (required)
        - lun (required)
        - storage_account_type (optional)
    - disk_encryption (block):
        - disk_encryption_target (required)
    - extensions (block):
        - auto_upgrade_minor_version (optional)
        - automatic_upgrade_enabled (optional)
        - name (required)
        - protected_settings (optional)
        - provision_after_extensions (optional)
        - publisher (required)
        - settings_json (optional)
        - type (required)
        - type_handler_version (optional)
    - fixed_scale (block):
        - node_deallocation_method (optional)
        - resize_timeout (optional)
        - target_dedicated_nodes (optional)
        - target_low_priority_nodes (optional)
    - identity (block):
        - identity_ids (required)
        - type (required)
    - mount (block):
        - azure_blob_file_system (optional, block):
            - account_key (optional)
            - account_name (required)
            - blobfuse_options (optional)
            - container_name (required)
            - identity_id (optional)
            - relative_mount_path (required)
            - sas_key (optional)
        - azure_file_share (optional, block):
            - account_key (required)
            - account_name (required)
            - azure_file_url (required)
            - mount_options (optional)
            - relative_mount_path (required)
        - cifs_mount (optional, block):
            - mount_options (optional)
            - password (required)
            - relative_mount_path (required)
            - source (required)
            - user_name (required)
        - nfs_mount (optional, block):
            - mount_options (optional)
            - relative_mount_path (required)
            - source (required)
    - network_configuration (block):
        - accelerated_networking_enabled (optional)
        - dynamic_vnet_assignment_scope (optional)
        - endpoint_configuration (optional, block):
            - backend_port (required)
            - frontend_port_range (required)
            - name (required)
            - network_security_group_rules (optional, block):
                - access (required)
                - priority (required)
                - source_address_prefix (required)
                - source_port_ranges (optional)
            - protocol (required)
        - public_address_provisioning_type (optional)
        - public_ips (optional)
        - subnet_id (optional)
    - node_placement (block):
        - policy (optional)
    - security_profile (block):
        - host_encryption_enabled (optional)
        - secure_boot_enabled (optional)
        - security_type (optional)
        - vtpm_enabled (optional)
    - start_task (block):
        - command_line (required)
        - common_environment_properties (optional)
        - container (optional, block):
            - image_name (required)
            - registry (optional, block):
                - password (optional)
                - registry_server (required)
                - user_assigned_identity_id (optional)
                - user_name (optional)
            - run_options (optional)
            - working_directory (optional)
        - resource_file (optional, block):
            - auto_storage_container_name (optional)
            - blob_prefix (optional)
            - file_mode (optional)
            - file_path (optional)
            - http_url (optional)
            - storage_container_url (optional)
            - user_assigned_identity_id (optional)
        - task_retry_maximum (optional)
        - user_identity (required, block):
            - auto_user (optional, block):
                - elevation_level (optional)
                - scope (optional)
            - user_name (optional)
        - wait_for_success (optional)
    - task_scheduling_policy (block):
        - node_fill_type (optional)
    - user_accounts (block):
        - elevation_level (required)
        - linux_user_configuration (optional, block):
            - gid (optional)
            - ssh_private_key (optional)
            - uid (optional)
        - name (required)
        - password (required)
        - windows_user_configuration (optional, block):
            - login_mode (required)
    - windows (block):
        - enable_automatic_updates (optional)
EOT

  type = map(object({
    account_name                   = string
    name                           = string
    node_agent_sku_id              = string
    resource_group_name            = string
    vm_size                        = string
    display_name                   = optional(string)
    inter_node_communication       = optional(string)
    license_type                   = optional(string)
    max_tasks_per_node             = optional(number)
    metadata                       = optional(map(string))
    os_disk_placement              = optional(string)
    stop_pending_resize_operation  = optional(bool)
    target_node_communication_mode = optional(string)
    storage_image_reference = object({
      id        = optional(string)
      offer     = optional(string)
      publisher = optional(string)
      sku       = optional(string)
      version   = optional(string)
    })
    task_scheduling_policy = optional(list(object({
      node_fill_type = optional(string)
    })))
    start_task = optional(object({
      command_line                  = string
      common_environment_properties = optional(map(string))
      container = optional(list(object({
        image_name = string
        registry = optional(list(object({
          password                  = optional(string)
          registry_server           = string
          user_assigned_identity_id = optional(string)
          user_name                 = optional(string)
        })))
        run_options       = optional(string)
        working_directory = optional(string)
      })))
      resource_file = optional(list(object({
        auto_storage_container_name = optional(string)
        blob_prefix                 = optional(string)
        file_mode                   = optional(string)
        file_path                   = optional(string)
        http_url                    = optional(string)
        storage_container_url       = optional(string)
        user_assigned_identity_id   = optional(string)
      })))
      task_retry_maximum = optional(number)
      user_identity = object({
        auto_user = optional(object({
          elevation_level = optional(string)
          scope           = optional(string)
        }))
        user_name = optional(string)
      })
      wait_for_success = optional(bool)
    }))
    security_profile = optional(object({
      host_encryption_enabled = optional(bool)
      secure_boot_enabled     = optional(bool)
      security_type           = optional(string)
      vtpm_enabled            = optional(bool)
    }))
    node_placement = optional(list(object({
      policy = optional(string)
    })))
    network_configuration = optional(object({
      accelerated_networking_enabled = optional(bool)
      dynamic_vnet_assignment_scope  = optional(string)
      endpoint_configuration = optional(list(object({
        backend_port        = number
        frontend_port_range = string
        name                = string
        network_security_group_rules = optional(list(object({
          access                = string
          priority              = number
          source_address_prefix = string
          source_port_ranges    = optional(list(string))
        })))
        protocol = string
      })))
      public_address_provisioning_type = optional(string)
      public_ips                       = optional(set(string))
      subnet_id                        = optional(string)
    }))
    mount = optional(list(object({
      azure_blob_file_system = optional(object({
        account_key         = optional(string)
        account_name        = string
        blobfuse_options    = optional(string)
        container_name      = string
        identity_id         = optional(string)
        relative_mount_path = string
        sas_key             = optional(string)
      }))
      azure_file_share = optional(list(object({
        account_key         = string
        account_name        = string
        azure_file_url      = string
        mount_options       = optional(string)
        relative_mount_path = string
      })))
      cifs_mount = optional(list(object({
        mount_options       = optional(string)
        password            = string
        relative_mount_path = string
        source              = string
        user_name           = string
      })))
      nfs_mount = optional(list(object({
        mount_options       = optional(string)
        relative_mount_path = string
        source              = string
      })))
    })))
    user_accounts = optional(list(object({
      elevation_level = string
      linux_user_configuration = optional(list(object({
        gid             = optional(number)
        ssh_private_key = optional(string)
        uid             = optional(number)
      })))
      name     = string
      password = string
      windows_user_configuration = optional(list(object({
        login_mode = string
      })))
    })))
    identity = optional(object({
      identity_ids = set(string)
      type         = string
    }))
    extensions = optional(list(object({
      auto_upgrade_minor_version = optional(bool)
      automatic_upgrade_enabled  = optional(bool)
      name                       = string
      protected_settings         = optional(string)
      provision_after_extensions = optional(set(string))
      publisher                  = string
      settings_json              = optional(string)
      type                       = string
      type_handler_version       = optional(string)
    })))
    disk_encryption = optional(list(object({
      disk_encryption_target = string
    })))
    data_disks = optional(list(object({
      caching              = optional(string)
      disk_size_gb         = number
      lun                  = number
      storage_account_type = optional(string)
    })))
    container_configuration = optional(object({
      container_image_names = optional(set(string))
      container_registries = optional(list(object({
        password                  = optional(string)
        registry_server           = optional(string)
        user_assigned_identity_id = optional(string)
        user_name                 = optional(string)
      })))
      type = optional(string)
    }))
    certificate = optional(list(object({
      id             = string
      store_location = string
      store_name     = optional(string)
      visibility     = optional(set(string))
    })))
    auto_scale = optional(object({
      evaluation_interval = optional(string)
      formula             = string
    }))
    fixed_scale = optional(object({
      node_deallocation_method  = optional(string)
      resize_timeout            = optional(string)
      target_dedicated_nodes    = optional(number)
      target_low_priority_nodes = optional(number)
    }))
    windows = optional(list(object({
      enable_automatic_updates = optional(bool)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        length(v.name) <= 64
      )
    ])
    error_message = "[from validate.PoolName: invalid when len(value) > 64]"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        length(v.account_name) <= 24
      )
    ])
    error_message = "[from validate.AccountName: invalid when len(value) > 24]"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.max_tasks_per_node == null || (v.max_tasks_per_node >= 1)
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.fixed_scale == null || (v.fixed_scale.target_dedicated_nodes == null || (v.fixed_scale.target_dedicated_nodes >= 0 && v.fixed_scale.target_dedicated_nodes <= 2000))
      )
    ])
    error_message = "must be between 0 and 2000"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.fixed_scale == null || (v.fixed_scale.target_low_priority_nodes == null || (v.fixed_scale.target_low_priority_nodes >= 0 && v.fixed_scale.target_low_priority_nodes <= 1000))
      )
    ])
    error_message = "must be between 0 and 1000"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.container_configuration == null || (v.container_configuration.type == null || (length(v.container_configuration.type) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.container_configuration == null || (v.container_configuration.container_image_names == null || (alltrue([for x in v.container_configuration.container_image_names : length(x) > 0])))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.storage_image_reference.publisher == null || (length(v.storage_image_reference.publisher) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.storage_image_reference.offer == null || (length(v.storage_image_reference.offer) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.storage_image_reference.sku == null || (length(v.storage_image_reference.sku) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.storage_image_reference.version == null || (length(v.storage_image_reference.version) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.metadata == null || (alltrue([for x in v.metadata : length(x) > 0]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || alltrue([for item in v.mount : (item.azure_blob_file_system == null || (length(item.azure_blob_file_system.account_name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || alltrue([for item in v.mount : (item.azure_blob_file_system == null || (length(item.azure_blob_file_system.container_name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || alltrue([for item in v.mount : (item.azure_blob_file_system == null || (length(item.azure_blob_file_system.relative_mount_path) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || alltrue([for item in v.mount : (item.azure_blob_file_system == null || (item.azure_blob_file_system.account_key == null || (length(item.azure_blob_file_system.account_key) > 0)))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || alltrue([for item in v.mount : (item.azure_blob_file_system == null || (item.azure_blob_file_system.sas_key == null || (length(item.azure_blob_file_system.sas_key) > 0)))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || alltrue([for item in v.mount : (item.azure_blob_file_system == null || (item.azure_blob_file_system.blobfuse_options == null || (length(item.azure_blob_file_system.blobfuse_options) > 0)))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || alltrue([for item in v.mount : (item.azure_file_share == null || alltrue([for item in item.azure_file_share : (length(item.account_name) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || alltrue([for item in v.mount : (item.azure_file_share == null || alltrue([for item in item.azure_file_share : (length(item.account_key) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || alltrue([for item in v.mount : (item.azure_file_share == null || alltrue([for item in item.azure_file_share : (length(item.relative_mount_path) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || alltrue([for item in v.mount : (item.azure_file_share == null || alltrue([for item in item.azure_file_share : (item.mount_options == null || (length(item.mount_options) > 0))]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || alltrue([for item in v.mount : (item.cifs_mount == null || alltrue([for item in item.cifs_mount : (length(item.user_name) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || alltrue([for item in v.mount : (item.cifs_mount == null || alltrue([for item in item.cifs_mount : (length(item.source) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || alltrue([for item in v.mount : (item.cifs_mount == null || alltrue([for item in item.cifs_mount : (length(item.relative_mount_path) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || alltrue([for item in v.mount : (item.cifs_mount == null || alltrue([for item in item.cifs_mount : (item.mount_options == null || (length(item.mount_options) > 0))]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || alltrue([for item in v.mount : (item.cifs_mount == null || alltrue([for item in item.cifs_mount : (length(item.password) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || alltrue([for item in v.mount : (item.nfs_mount == null || alltrue([for item in item.nfs_mount : (length(item.source) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || alltrue([for item in v.mount : (item.nfs_mount == null || alltrue([for item in item.nfs_mount : (length(item.relative_mount_path) > 0)]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || alltrue([for item in v.mount : (item.nfs_mount == null || alltrue([for item in item.nfs_mount : (item.mount_options == null || (length(item.mount_options) > 0))]))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.network_configuration == null || (v.network_configuration.subnet_id == null || (length(v.network_configuration.subnet_id) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.network_configuration == null || (v.network_configuration.endpoint_configuration == null || alltrue([for item in v.network_configuration.endpoint_configuration : (length(item.name) > 0)]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.network_configuration == null || (v.network_configuration.endpoint_configuration == null || alltrue([for item in v.network_configuration.endpoint_configuration : (item.network_security_group_rules == null || alltrue([for item in item.network_security_group_rules : (item.priority >= 150)]))]))
      )
    ])
    error_message = "must be at least 150"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.network_configuration == null || (v.network_configuration.endpoint_configuration == null || alltrue([for item in v.network_configuration.endpoint_configuration : (item.network_security_group_rules == null || alltrue([for item in item.network_security_group_rules : (length(item.source_address_prefix) > 0)]))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.network_configuration == null || (v.network_configuration.endpoint_configuration == null || alltrue([for item in v.network_configuration.endpoint_configuration : (item.network_security_group_rules == null || alltrue([for item in item.network_security_group_rules : (item.source_port_ranges == null || (alltrue([for x in item.source_port_ranges : length(x) > 0])))]))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.data_disks == null || alltrue([for item in v.data_disks : (item.lun >= 0 && item.lun <= 63)])
      )
    ])
    error_message = "must be between 0 and 63"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.data_disks == null || alltrue([for item in v.data_disks : (item.disk_size_gb >= 0)])
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.extensions == null || alltrue([for item in v.extensions : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.extensions == null || alltrue([for item in v.extensions : (length(item.publisher) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.extensions == null || alltrue([for item in v.extensions : (length(item.type) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.extensions == null || alltrue([for item in v.extensions : (item.type_handler_version == null || (length(item.type_handler_version) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.extensions == null || alltrue([for item in v.extensions : (item.settings_json == null || (can(jsondecode(item.settings_json))))])
      )
    ])
    error_message = "must be valid JSON"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.extensions == null || alltrue([for item in v.extensions : (item.provision_after_extensions == null || (alltrue([for x in item.provision_after_extensions : length(x) > 0])))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.license_type == null || (length(v.license_type) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.user_accounts == null || alltrue([for item in v.user_accounts : (length(item.name) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.user_accounts == null || alltrue([for item in v.user_accounts : (length(item.password) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 41 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

