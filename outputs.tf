output "batch_pools" {
  description = "All batch_pool resources"
  value       = azurerm_batch_pool.batch_pools
  sensitive   = true
}
output "batch_pools_account_name" {
  description = "List of account_name values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.account_name]
}
output "batch_pools_auto_scale" {
  description = "List of auto_scale values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.auto_scale]
}
output "batch_pools_certificate" {
  description = "List of certificate values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.certificate]
}
output "batch_pools_container_configuration" {
  description = "List of container_configuration values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.container_configuration]
}
output "batch_pools_data_disks" {
  description = "List of data_disks values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.data_disks]
}
output "batch_pools_disk_encryption" {
  description = "List of disk_encryption values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.disk_encryption]
}
output "batch_pools_display_name" {
  description = "List of display_name values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.display_name]
}
output "batch_pools_extensions" {
  description = "List of extensions values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.extensions]
  sensitive   = true
}
output "batch_pools_fixed_scale" {
  description = "List of fixed_scale values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.fixed_scale]
}
output "batch_pools_identity" {
  description = "List of identity values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.identity]
}
output "batch_pools_inter_node_communication" {
  description = "List of inter_node_communication values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.inter_node_communication]
}
output "batch_pools_license_type" {
  description = "List of license_type values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.license_type]
}
output "batch_pools_max_tasks_per_node" {
  description = "List of max_tasks_per_node values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.max_tasks_per_node]
}
output "batch_pools_metadata" {
  description = "List of metadata values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.metadata]
}
output "batch_pools_mount" {
  description = "List of mount values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.mount]
  sensitive   = true
}
output "batch_pools_name" {
  description = "List of name values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.name]
}
output "batch_pools_network_configuration" {
  description = "List of network_configuration values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.network_configuration]
}
output "batch_pools_node_agent_sku_id" {
  description = "List of node_agent_sku_id values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.node_agent_sku_id]
}
output "batch_pools_node_placement" {
  description = "List of node_placement values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.node_placement]
}
output "batch_pools_os_disk_placement" {
  description = "List of os_disk_placement values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.os_disk_placement]
}
output "batch_pools_resource_group_name" {
  description = "List of resource_group_name values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.resource_group_name]
}
output "batch_pools_security_profile" {
  description = "List of security_profile values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.security_profile]
}
output "batch_pools_start_task" {
  description = "List of start_task values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.start_task]
  sensitive   = true
}
output "batch_pools_stop_pending_resize_operation" {
  description = "List of stop_pending_resize_operation values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.stop_pending_resize_operation]
}
output "batch_pools_storage_image_reference" {
  description = "List of storage_image_reference values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.storage_image_reference]
}
output "batch_pools_target_node_communication_mode" {
  description = "List of target_node_communication_mode values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.target_node_communication_mode]
}
output "batch_pools_task_scheduling_policy" {
  description = "List of task_scheduling_policy values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.task_scheduling_policy]
}
output "batch_pools_user_accounts" {
  description = "List of user_accounts values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.user_accounts]
  sensitive   = true
}
output "batch_pools_vm_size" {
  description = "List of vm_size values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.vm_size]
}
output "batch_pools_windows" {
  description = "List of windows values across all batch_pools"
  value       = [for k, v in azurerm_batch_pool.batch_pools : v.windows]
}

