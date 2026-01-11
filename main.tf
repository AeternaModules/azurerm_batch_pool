resource "azurerm_batch_pool" "batch_pools" {
  for_each = var.batch_pools

  account_name                   = each.value.account_name
  name                           = each.value.name
  node_agent_sku_id              = each.value.node_agent_sku_id
  resource_group_name            = each.value.resource_group_name
  vm_size                        = each.value.vm_size
  display_name                   = each.value.display_name
  inter_node_communication       = each.value.inter_node_communication
  license_type                   = each.value.license_type
  max_tasks_per_node             = each.value.max_tasks_per_node
  metadata                       = each.value.metadata
  os_disk_placement              = each.value.os_disk_placement
  stop_pending_resize_operation  = each.value.stop_pending_resize_operation
  target_node_communication_mode = each.value.target_node_communication_mode

  storage_image_reference {
    id        = each.value.storage_image_reference.id
    offer     = each.value.storage_image_reference.offer
    publisher = each.value.storage_image_reference.publisher
    sku       = each.value.storage_image_reference.sku
    version   = each.value.storage_image_reference.version
  }

  dynamic "auto_scale" {
    for_each = each.value.auto_scale != null ? [each.value.auto_scale] : []
    content {
      evaluation_interval = auto_scale.value.evaluation_interval
      formula             = auto_scale.value.formula
    }
  }

  dynamic "certificate" {
    for_each = each.value.certificate != null ? [each.value.certificate] : []
    content {
      id             = certificate.value.id
      store_location = certificate.value.store_location
      store_name     = certificate.value.store_name
      visibility     = certificate.value.visibility
    }
  }

  dynamic "container_configuration" {
    for_each = each.value.container_configuration != null ? [each.value.container_configuration] : []
    content {
      container_image_names = container_configuration.value.container_image_names
      dynamic "container_registries" {
        for_each = container_configuration.value.container_registries != null ? [container_configuration.value.container_registries] : []
        content {
          password                  = container_registries.value.password
          registry_server           = container_registries.value.registry_server
          user_assigned_identity_id = container_registries.value.user_assigned_identity_id
          user_name                 = container_registries.value.user_name
        }
      }
      type = container_configuration.value.type
    }
  }

  dynamic "data_disks" {
    for_each = each.value.data_disks != null ? [each.value.data_disks] : []
    content {
      caching              = data_disks.value.caching
      disk_size_gb         = data_disks.value.disk_size_gb
      lun                  = data_disks.value.lun
      storage_account_type = data_disks.value.storage_account_type
    }
  }

  dynamic "disk_encryption" {
    for_each = each.value.disk_encryption != null ? [each.value.disk_encryption] : []
    content {
      disk_encryption_target = disk_encryption.value.disk_encryption_target
    }
  }

  dynamic "extensions" {
    for_each = each.value.extensions != null ? [each.value.extensions] : []
    content {
      auto_upgrade_minor_version = extensions.value.auto_upgrade_minor_version
      automatic_upgrade_enabled  = extensions.value.automatic_upgrade_enabled
      name                       = extensions.value.name
      protected_settings         = extensions.value.protected_settings
      provision_after_extensions = extensions.value.provision_after_extensions
      publisher                  = extensions.value.publisher
      settings_json              = extensions.value.settings_json
      type                       = extensions.value.type
      type_handler_version       = extensions.value.type_handler_version
    }
  }

  dynamic "fixed_scale" {
    for_each = each.value.fixed_scale != null ? [each.value.fixed_scale] : []
    content {
      node_deallocation_method  = fixed_scale.value.node_deallocation_method
      resize_timeout            = fixed_scale.value.resize_timeout
      target_dedicated_nodes    = fixed_scale.value.target_dedicated_nodes
      target_low_priority_nodes = fixed_scale.value.target_low_priority_nodes
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }

  dynamic "mount" {
    for_each = each.value.mount != null ? [each.value.mount] : []
    content {
      dynamic "azure_blob_file_system" {
        for_each = mount.value.azure_blob_file_system != null ? [mount.value.azure_blob_file_system] : []
        content {
          account_key         = azure_blob_file_system.value.account_key
          account_name        = azure_blob_file_system.value.account_name
          blobfuse_options    = azure_blob_file_system.value.blobfuse_options
          container_name      = azure_blob_file_system.value.container_name
          identity_id         = azure_blob_file_system.value.identity_id
          relative_mount_path = azure_blob_file_system.value.relative_mount_path
          sas_key             = azure_blob_file_system.value.sas_key
        }
      }
      dynamic "azure_file_share" {
        for_each = mount.value.azure_file_share != null ? [mount.value.azure_file_share] : []
        content {
          account_key         = azure_file_share.value.account_key
          account_name        = azure_file_share.value.account_name
          azure_file_url      = azure_file_share.value.azure_file_url
          mount_options       = azure_file_share.value.mount_options
          relative_mount_path = azure_file_share.value.relative_mount_path
        }
      }
      dynamic "cifs_mount" {
        for_each = mount.value.cifs_mount != null ? [mount.value.cifs_mount] : []
        content {
          mount_options       = cifs_mount.value.mount_options
          password            = cifs_mount.value.password
          relative_mount_path = cifs_mount.value.relative_mount_path
          source              = cifs_mount.value.source
          user_name           = cifs_mount.value.user_name
        }
      }
      dynamic "nfs_mount" {
        for_each = mount.value.nfs_mount != null ? [mount.value.nfs_mount] : []
        content {
          mount_options       = nfs_mount.value.mount_options
          relative_mount_path = nfs_mount.value.relative_mount_path
          source              = nfs_mount.value.source
        }
      }
    }
  }

  dynamic "network_configuration" {
    for_each = each.value.network_configuration != null ? [each.value.network_configuration] : []
    content {
      accelerated_networking_enabled = network_configuration.value.accelerated_networking_enabled
      dynamic_vnet_assignment_scope  = network_configuration.value.dynamic_vnet_assignment_scope
      dynamic "endpoint_configuration" {
        for_each = network_configuration.value.endpoint_configuration != null ? [network_configuration.value.endpoint_configuration] : []
        content {
          backend_port        = endpoint_configuration.value.backend_port
          frontend_port_range = endpoint_configuration.value.frontend_port_range
          name                = endpoint_configuration.value.name
          dynamic "network_security_group_rules" {
            for_each = endpoint_configuration.value.network_security_group_rules != null ? [endpoint_configuration.value.network_security_group_rules] : []
            content {
              access                = network_security_group_rules.value.access
              priority              = network_security_group_rules.value.priority
              source_address_prefix = network_security_group_rules.value.source_address_prefix
              source_port_ranges    = network_security_group_rules.value.source_port_ranges
            }
          }
          protocol = endpoint_configuration.value.protocol
        }
      }
      public_address_provisioning_type = network_configuration.value.public_address_provisioning_type
      public_ips                       = network_configuration.value.public_ips
      subnet_id                        = network_configuration.value.subnet_id
    }
  }

  dynamic "node_placement" {
    for_each = each.value.node_placement != null ? [each.value.node_placement] : []
    content {
      policy = node_placement.value.policy
    }
  }

  dynamic "security_profile" {
    for_each = each.value.security_profile != null ? [each.value.security_profile] : []
    content {
      host_encryption_enabled = security_profile.value.host_encryption_enabled
      secure_boot_enabled     = security_profile.value.secure_boot_enabled
      security_type           = security_profile.value.security_type
      vtpm_enabled            = security_profile.value.vtpm_enabled
    }
  }

  dynamic "start_task" {
    for_each = each.value.start_task != null ? [each.value.start_task] : []
    content {
      command_line                  = start_task.value.command_line
      common_environment_properties = start_task.value.common_environment_properties
      dynamic "container" {
        for_each = start_task.value.container != null ? [start_task.value.container] : []
        content {
          image_name = container.value.image_name
          dynamic "registry" {
            for_each = container.value.registry != null ? [container.value.registry] : []
            content {
              password                  = registry.value.password
              registry_server           = registry.value.registry_server
              user_assigned_identity_id = registry.value.user_assigned_identity_id
              user_name                 = registry.value.user_name
            }
          }
          run_options       = container.value.run_options
          working_directory = container.value.working_directory
        }
      }
      dynamic "resource_file" {
        for_each = start_task.value.resource_file != null ? [start_task.value.resource_file] : []
        content {
          auto_storage_container_name = resource_file.value.auto_storage_container_name
          blob_prefix                 = resource_file.value.blob_prefix
          file_mode                   = resource_file.value.file_mode
          file_path                   = resource_file.value.file_path
          http_url                    = resource_file.value.http_url
          storage_container_url       = resource_file.value.storage_container_url
          user_assigned_identity_id   = resource_file.value.user_assigned_identity_id
        }
      }
      task_retry_maximum = start_task.value.task_retry_maximum
      user_identity {
        dynamic "auto_user" {
          for_each = start_task.value.user_identity.auto_user != null ? [start_task.value.user_identity.auto_user] : []
          content {
            elevation_level = auto_user.value.elevation_level
            scope           = auto_user.value.scope
          }
        }
        user_name = start_task.value.user_identity.user_name
      }
      wait_for_success = start_task.value.wait_for_success
    }
  }

  dynamic "task_scheduling_policy" {
    for_each = each.value.task_scheduling_policy != null ? [each.value.task_scheduling_policy] : []
    content {
      node_fill_type = task_scheduling_policy.value.node_fill_type
    }
  }

  dynamic "user_accounts" {
    for_each = each.value.user_accounts != null ? [each.value.user_accounts] : []
    content {
      elevation_level = user_accounts.value.elevation_level
      dynamic "linux_user_configuration" {
        for_each = user_accounts.value.linux_user_configuration != null ? [user_accounts.value.linux_user_configuration] : []
        content {
          gid             = linux_user_configuration.value.gid
          ssh_private_key = linux_user_configuration.value.ssh_private_key
          uid             = linux_user_configuration.value.uid
        }
      }
      name     = user_accounts.value.name
      password = user_accounts.value.password
      dynamic "windows_user_configuration" {
        for_each = user_accounts.value.windows_user_configuration != null ? [user_accounts.value.windows_user_configuration] : []
        content {
          login_mode = windows_user_configuration.value.login_mode
        }
      }
    }
  }

  dynamic "windows" {
    for_each = each.value.windows != null ? [each.value.windows] : []
    content {
      enable_automatic_updates = windows.value.enable_automatic_updates
    }
  }
}

