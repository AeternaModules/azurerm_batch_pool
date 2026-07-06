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
            - registry_server (required)
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
    inter_node_communication       = optional(string) # Default: "Enabled"
    license_type                   = optional(string)
    max_tasks_per_node             = optional(number) # Default: 1
    metadata                       = optional(map(string))
    os_disk_placement              = optional(string)
    stop_pending_resize_operation  = optional(bool) # Default: false
    target_node_communication_mode = optional(string)
    storage_image_reference = object({
      id        = optional(string)
      offer     = optional(string)
      publisher = optional(string)
      sku       = optional(string)
      version   = optional(string)
    })
    task_scheduling_policy = optional(object({
      node_fill_type = optional(string)
    }))
    start_task = optional(object({
      command_line                  = string
      common_environment_properties = optional(map(string))
      container = optional(object({
        image_name = string
        registry = optional(object({
          password                  = optional(string)
          registry_server           = string
          user_assigned_identity_id = optional(string)
          user_name                 = optional(string)
        }))
        run_options       = optional(string)
        working_directory = optional(string)
      }))
      resource_file = optional(object({
        auto_storage_container_name = optional(string)
        blob_prefix                 = optional(string)
        file_mode                   = optional(string)
        file_path                   = optional(string)
        http_url                    = optional(string)
        storage_container_url       = optional(string)
        user_assigned_identity_id   = optional(string)
      }))
      task_retry_maximum = optional(number)
      user_identity = object({
        auto_user = optional(object({
          elevation_level = optional(string) # Default: "NonAdmin"
          scope           = optional(string) # Default: "Task"
        }))
        user_name = optional(string)
      })
      wait_for_success = optional(bool) # Default: false
    }))
    security_profile = optional(object({
      host_encryption_enabled = optional(bool)
      secure_boot_enabled     = optional(bool)
      security_type           = optional(string)
      vtpm_enabled            = optional(bool)
    }))
    node_placement = optional(object({
      policy = optional(string) # Default: "Regional"
    }))
    network_configuration = optional(object({
      accelerated_networking_enabled = optional(bool)   # Default: false
      dynamic_vnet_assignment_scope  = optional(string) # Default: "none"
      endpoint_configuration = optional(object({
        backend_port        = number
        frontend_port_range = string
        name                = string
        network_security_group_rules = optional(object({
          access                = string
          priority              = number
          source_address_prefix = string
          source_port_ranges    = optional(list(string))
        }))
        protocol = string
      }))
      public_address_provisioning_type = optional(string)
      public_ips                       = optional(set(string))
      subnet_id                        = optional(string)
    }))
    mount = optional(object({
      azure_blob_file_system = optional(object({
        account_key         = optional(string)
        account_name        = string
        blobfuse_options    = optional(string)
        container_name      = string
        identity_id         = optional(string)
        relative_mount_path = string
        sas_key             = optional(string)
      }))
      azure_file_share = optional(object({
        account_key         = string
        account_name        = string
        azure_file_url      = string
        mount_options       = optional(string)
        relative_mount_path = string
      }))
      cifs_mount = optional(object({
        mount_options       = optional(string)
        password            = string
        relative_mount_path = string
        source              = string
        user_name           = string
      }))
      nfs_mount = optional(object({
        mount_options       = optional(string)
        relative_mount_path = string
        source              = string
      }))
    }))
    user_accounts = optional(object({
      elevation_level = string
      linux_user_configuration = optional(object({
        gid             = optional(number)
        ssh_private_key = optional(string)
        uid             = optional(number)
      }))
      name     = string
      password = string
      windows_user_configuration = optional(object({
        login_mode = string
      }))
    }))
    identity = optional(object({
      identity_ids = set(string)
      type         = string
    }))
    extensions = optional(object({
      auto_upgrade_minor_version = optional(bool)
      automatic_upgrade_enabled  = optional(bool)
      name                       = string
      protected_settings         = optional(string)
      provision_after_extensions = optional(set(string))
      publisher                  = string
      settings_json              = optional(string)
      type                       = string
      type_handler_version       = optional(string)
    }))
    disk_encryption = optional(object({
      disk_encryption_target = string
    }))
    data_disks = optional(object({
      caching              = optional(string) # Default: "ReadOnly"
      disk_size_gb         = number
      lun                  = number
      storage_account_type = optional(string) # Default: "Standard_LRS"
    }))
    container_configuration = optional(object({
      container_image_names = optional(set(string))
      container_registries = optional(object({
        password                  = optional(string)
        registry_server           = string
        user_assigned_identity_id = optional(string)
        user_name                 = optional(string)
      }))
      type = optional(string)
    }))
    certificate = optional(object({
      id             = string
      store_location = string
      store_name     = optional(string)
      visibility     = optional(set(string))
    }))
    auto_scale = optional(object({
      evaluation_interval = optional(string) # Default: "PT15M"
      formula             = string
    }))
    fixed_scale = optional(object({
      node_deallocation_method  = optional(string)
      resize_timeout            = optional(string) # Default: "PT15M"
      target_dedicated_nodes    = optional(number) # Default: 1
      target_low_priority_nodes = optional(number) # Default: 0
    }))
    windows = optional(object({
      enable_automatic_updates = optional(bool) # Default: true
    }))
  }))
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
        v.container_configuration == null || (v.container_configuration.container_image_names == null || (length(v.container_configuration.container_image_names) > 0))
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
        v.metadata == null || (length(v.metadata) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || (v.mount.azure_blob_file_system == null || (length(v.mount.azure_blob_file_system.account_name) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || (v.mount.azure_blob_file_system == null || (length(v.mount.azure_blob_file_system.container_name) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || (v.mount.azure_blob_file_system == null || (length(v.mount.azure_blob_file_system.relative_mount_path) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || (v.mount.azure_blob_file_system == null || (v.mount.azure_blob_file_system.account_key == null || (length(v.mount.azure_blob_file_system.account_key) > 0)))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || (v.mount.azure_blob_file_system == null || (v.mount.azure_blob_file_system.sas_key == null || (length(v.mount.azure_blob_file_system.sas_key) > 0)))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || (v.mount.azure_blob_file_system == null || (v.mount.azure_blob_file_system.blobfuse_options == null || (length(v.mount.azure_blob_file_system.blobfuse_options) > 0)))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || (v.mount.azure_file_share == null || (length(v.mount.azure_file_share.account_name) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || (v.mount.azure_file_share == null || (length(v.mount.azure_file_share.account_key) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || (v.mount.azure_file_share == null || (length(v.mount.azure_file_share.relative_mount_path) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || (v.mount.azure_file_share == null || (v.mount.azure_file_share.mount_options == null || (length(v.mount.azure_file_share.mount_options) > 0)))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || (v.mount.cifs_mount == null || (length(v.mount.cifs_mount.user_name) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || (v.mount.cifs_mount == null || (length(v.mount.cifs_mount.source) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || (v.mount.cifs_mount == null || (length(v.mount.cifs_mount.relative_mount_path) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || (v.mount.cifs_mount == null || (v.mount.cifs_mount.mount_options == null || (length(v.mount.cifs_mount.mount_options) > 0)))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || (v.mount.cifs_mount == null || (length(v.mount.cifs_mount.password) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || (v.mount.nfs_mount == null || (length(v.mount.nfs_mount.source) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || (v.mount.nfs_mount == null || (length(v.mount.nfs_mount.relative_mount_path) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.mount == null || (v.mount.nfs_mount == null || (v.mount.nfs_mount.mount_options == null || (length(v.mount.nfs_mount.mount_options) > 0)))
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
        v.network_configuration == null || (v.network_configuration.endpoint_configuration == null || (length(v.network_configuration.endpoint_configuration.name) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.network_configuration == null || (v.network_configuration.endpoint_configuration == null || (v.network_configuration.endpoint_configuration.network_security_group_rules == null || (v.network_configuration.endpoint_configuration.network_security_group_rules.priority >= 150)))
      )
    ])
    error_message = "must be at least 150"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.network_configuration == null || (v.network_configuration.endpoint_configuration == null || (v.network_configuration.endpoint_configuration.network_security_group_rules == null || (length(v.network_configuration.endpoint_configuration.network_security_group_rules.source_address_prefix) > 0)))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.network_configuration == null || (v.network_configuration.endpoint_configuration == null || (v.network_configuration.endpoint_configuration.network_security_group_rules == null || (v.network_configuration.endpoint_configuration.network_security_group_rules.source_port_ranges == null || (length(v.network_configuration.endpoint_configuration.network_security_group_rules.source_port_ranges) > 0))))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.data_disks == null || (v.data_disks.lun >= 0 && v.data_disks.lun <= 63)
      )
    ])
    error_message = "must be between 0 and 63"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.data_disks == null || (v.data_disks.disk_size_gb >= 0)
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.extensions == null || (length(v.extensions.name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.extensions == null || (length(v.extensions.publisher) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.extensions == null || (length(v.extensions.type) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.extensions == null || (v.extensions.type_handler_version == null || (length(v.extensions.type_handler_version) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.extensions == null || (v.extensions.provision_after_extensions == null || (length(v.extensions.provision_after_extensions) > 0))
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
        v.user_accounts == null || (length(v.user_accounts.name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.batch_pools : (
        v.user_accounts == null || (length(v.user_accounts.password) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_batch_pool's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.PoolName] !regexp.MustCompile(`^[a-zA-Z0-9_-]+$`).MatchString(value)
  # path: name
  #   source:    [from validate.PoolName] 1 > len(value)
  # path: name
  #   condition: length(value) <= 64
  #   message:   [from validate.PoolName: invalid when len(value) > 64]
  #   source:    [from validate.PoolName: invalid when len(value) > 64]
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: account_name
  #   source:    [from validate.AccountName] !regexp.MustCompile(`^[a-z0-9]+$`).MatchString(value)
  # path: account_name
  #   source:    [from validate.AccountName] 3 > len(value)
  # path: account_name
  #   condition: length(value) <= 24
  #   message:   [from validate.AccountName: invalid when len(value) > 24]
  #   source:    [from validate.AccountName: invalid when len(value) > 24]
  # path: fixed_scale.node_deallocation_method
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: storage_image_reference.id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: storage_image_reference.id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: mount.azure_blob_file_system.identity_id
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: mount.azure_blob_file_system.identity_id
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: mount.azure_file_share.azure_file_url
  #   source:    validation.IsURLWithHTTPS(...) - no translation rule yet, add one
  # path: network_configuration.dynamic_vnet_assignment_scope
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: network_configuration.public_address_provisioning_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: network_configuration.endpoint_configuration.protocol
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: network_configuration.endpoint_configuration.backend_port
  #   source:    validation.All(...) - no translation rule yet, add one
  # path: network_configuration.endpoint_configuration.frontend_port_range
  #   source:    [from validate.FrontendPortRange] !ok
  # path: network_configuration.endpoint_configuration.frontend_port_range
  #   condition: length(value) == 2
  #   message:   [from validate.FrontendPortRange: invalid when len(value) != 2]
  #   source:    [from validate.FrontendPortRange: invalid when len(value) != 2]
  # path: network_configuration.endpoint_configuration.frontend_port_range
  #   source:    [from validate.FrontendPortRange] err != nil
  # path: network_configuration.endpoint_configuration.frontend_port_range
  #   source:    [from validate.FrontendPortRange] err != nil
  # path: network_configuration.endpoint_configuration.frontend_port_range
  #   source:    [from validate.FrontendPortRange] !validPortNumber(startPort) || !validPortNumber(endPort)
  # path: network_configuration.endpoint_configuration.frontend_port_range
  #   source:    [from validate.FrontendPortRange] endPort-startPort < 100
  # path: network_configuration.endpoint_configuration.network_security_group_rules.access
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: data_disks.caching
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: data_disks.storage_account_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: disk_encryption.disk_encryption_target
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: extensions.settings_json
  #   source:    validation.StringIsJSON(...) - no translation rule yet, add one
  # path: node_placement.policy
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: os_disk_placement
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: inter_node_communication
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: security_profile.security_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: target_node_communication_mode
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: task_scheduling_policy.node_fill_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: user_accounts.elevation_level
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: user_accounts.windows_user_configuration.login_mode
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: store_location
  #   condition: contains(["CurrentUser", "LocalMachine"], value)
  #   message:   must be one of: CurrentUser, LocalMachine
  # path: store_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: visibility[*]
  #   condition: contains(["StartTask", "Task", "RemoteUser"], value)
  #   message:   must be one of: StartTask, Task, RemoteUser
}

