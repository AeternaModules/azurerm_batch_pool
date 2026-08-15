output "batch_pools_id" {
  description = "Map of id values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.id if v.id != null && length(v.id) > 0 }
}
output "batch_pools_account_name" {
  description = "Map of account_name values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.account_name if v.account_name != null && length(v.account_name) > 0 }
}
output "batch_pools_auto_scale" {
  description = "Map of auto_scale values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => one(v.auto_scale) if v.auto_scale != null && length(v.auto_scale) > 0 }
}
output "batch_pools_container_configuration" {
  description = "Map of container_configuration values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => one(v.container_configuration) if v.container_configuration != null && length(v.container_configuration) > 0 }
}
output "batch_pools_data_disks" {
  description = "Map of data_disks values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.data_disks if v.data_disks != null && length(v.data_disks) > 0 }
}
output "batch_pools_disk_encryption" {
  description = "Map of disk_encryption values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.disk_encryption if v.disk_encryption != null && length(v.disk_encryption) > 0 }
}
output "batch_pools_display_name" {
  description = "Map of display_name values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "batch_pools_extensions" {
  description = "Map of extensions values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.extensions if v.extensions != null && length(v.extensions) > 0 }
  sensitive   = true
}
output "batch_pools_fixed_scale" {
  description = "Map of fixed_scale values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => one(v.fixed_scale) if v.fixed_scale != null && length(v.fixed_scale) > 0 }
}
output "batch_pools_identity" {
  description = "Map of identity values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => one(v.identity) if v.identity != null && length(v.identity) > 0 }
}
output "batch_pools_inter_node_communication" {
  description = "Map of inter_node_communication values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.inter_node_communication if v.inter_node_communication != null && length(v.inter_node_communication) > 0 }
}
output "batch_pools_license_type" {
  description = "Map of license_type values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.license_type if v.license_type != null && length(v.license_type) > 0 }
}
output "batch_pools_max_tasks_per_node" {
  description = "Map of max_tasks_per_node values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.max_tasks_per_node if v.max_tasks_per_node != null }
}
output "batch_pools_metadata" {
  description = "Map of metadata values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.metadata if v.metadata != null && length(v.metadata) > 0 }
}
output "batch_pools_mount" {
  description = "Map of mount values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.mount if v.mount != null && length(v.mount) > 0 }
  sensitive   = true
}
output "batch_pools_name" {
  description = "Map of name values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.name if v.name != null && length(v.name) > 0 }
}
output "batch_pools_network_configuration" {
  description = "Map of network_configuration values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => one(v.network_configuration) if v.network_configuration != null && length(v.network_configuration) > 0 }
}
output "batch_pools_node_agent_sku_id" {
  description = "Map of node_agent_sku_id values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.node_agent_sku_id if v.node_agent_sku_id != null && length(v.node_agent_sku_id) > 0 }
}
output "batch_pools_node_placement" {
  description = "Map of node_placement values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.node_placement if v.node_placement != null && length(v.node_placement) > 0 }
}
output "batch_pools_os_disk_placement" {
  description = "Map of os_disk_placement values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.os_disk_placement if v.os_disk_placement != null && length(v.os_disk_placement) > 0 }
}
output "batch_pools_resource_group_name" {
  description = "Map of resource_group_name values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "batch_pools_security_profile" {
  description = "Map of security_profile values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => one(v.security_profile) if v.security_profile != null && length(v.security_profile) > 0 }
}
output "batch_pools_start_task" {
  description = "Map of start_task values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => one(v.start_task) if v.start_task != null && length(v.start_task) > 0 }
  sensitive   = true
}
output "batch_pools_stop_pending_resize_operation" {
  description = "Map of stop_pending_resize_operation values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.stop_pending_resize_operation if v.stop_pending_resize_operation != null }
}
output "batch_pools_storage_image_reference" {
  description = "Map of storage_image_reference values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => one(v.storage_image_reference) if v.storage_image_reference != null && length(v.storage_image_reference) > 0 }
}
output "batch_pools_target_node_communication_mode" {
  description = "Map of target_node_communication_mode values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.target_node_communication_mode if v.target_node_communication_mode != null && length(v.target_node_communication_mode) > 0 }
}
output "batch_pools_task_scheduling_policy" {
  description = "Map of task_scheduling_policy values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.task_scheduling_policy if v.task_scheduling_policy != null && length(v.task_scheduling_policy) > 0 }
}
output "batch_pools_user_accounts" {
  description = "Map of user_accounts values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.user_accounts if v.user_accounts != null && length(v.user_accounts) > 0 }
  sensitive   = true
}
output "batch_pools_vm_size" {
  description = "Map of vm_size values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.vm_size if v.vm_size != null && length(v.vm_size) > 0 }
}
output "batch_pools_windows" {
  description = "Map of windows values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.windows if v.windows != null && length(v.windows) > 0 }
}

