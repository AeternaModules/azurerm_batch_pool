output "batch_pools_account_name" {
  description = "Map of account_name values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.account_name }
}
output "batch_pools_auto_scale" {
  description = "Map of auto_scale values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.auto_scale }
}
output "batch_pools_certificate" {
  description = "Map of certificate values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.certificate }
}
output "batch_pools_container_configuration" {
  description = "Map of container_configuration values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.container_configuration }
}
output "batch_pools_data_disks" {
  description = "Map of data_disks values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.data_disks }
}
output "batch_pools_disk_encryption" {
  description = "Map of disk_encryption values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.disk_encryption }
}
output "batch_pools_display_name" {
  description = "Map of display_name values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.display_name }
}
output "batch_pools_extensions" {
  description = "Map of extensions values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.extensions }
  sensitive   = true
}
output "batch_pools_fixed_scale" {
  description = "Map of fixed_scale values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.fixed_scale }
}
output "batch_pools_identity" {
  description = "Map of identity values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.identity }
}
output "batch_pools_inter_node_communication" {
  description = "Map of inter_node_communication values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.inter_node_communication }
}
output "batch_pools_license_type" {
  description = "Map of license_type values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.license_type }
}
output "batch_pools_max_tasks_per_node" {
  description = "Map of max_tasks_per_node values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.max_tasks_per_node }
}
output "batch_pools_metadata" {
  description = "Map of metadata values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.metadata }
}
output "batch_pools_mount" {
  description = "Map of mount values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.mount }
  sensitive   = true
}
output "batch_pools_name" {
  description = "Map of name values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.name }
}
output "batch_pools_network_configuration" {
  description = "Map of network_configuration values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.network_configuration }
}
output "batch_pools_node_agent_sku_id" {
  description = "Map of node_agent_sku_id values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.node_agent_sku_id }
}
output "batch_pools_node_placement" {
  description = "Map of node_placement values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.node_placement }
}
output "batch_pools_os_disk_placement" {
  description = "Map of os_disk_placement values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.os_disk_placement }
}
output "batch_pools_resource_group_name" {
  description = "Map of resource_group_name values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.resource_group_name }
}
output "batch_pools_security_profile" {
  description = "Map of security_profile values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.security_profile }
}
output "batch_pools_start_task" {
  description = "Map of start_task values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.start_task }
  sensitive   = true
}
output "batch_pools_stop_pending_resize_operation" {
  description = "Map of stop_pending_resize_operation values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.stop_pending_resize_operation }
}
output "batch_pools_storage_image_reference" {
  description = "Map of storage_image_reference values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.storage_image_reference }
}
output "batch_pools_target_node_communication_mode" {
  description = "Map of target_node_communication_mode values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.target_node_communication_mode }
}
output "batch_pools_task_scheduling_policy" {
  description = "Map of task_scheduling_policy values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.task_scheduling_policy }
}
output "batch_pools_user_accounts" {
  description = "Map of user_accounts values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.user_accounts }
  sensitive   = true
}
output "batch_pools_vm_size" {
  description = "Map of vm_size values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.vm_size }
}
output "batch_pools_windows" {
  description = "Map of windows values across all batch_pools, keyed the same as var.batch_pools"
  value       = { for k, v in azurerm_batch_pool.batch_pools : k => v.windows }
}

