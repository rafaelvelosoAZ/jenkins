output "linux_vm_public_ips" {
  description = "Public IP's map for the all windows Virtual Machines"
  value       = var.enable_public_ip_address == true ? zipmap(azurerm_linux_virtual_machine.linux_vm.*.name, azurerm_linux_virtual_machine.linux_vm.*.public_ip_address) : null
}

output "linux_vm_private_ips" {
  description = "Public IP's map for the all windows Virtual Machines"
  value       = zipmap(azurerm_linux_virtual_machine.linux_vm.*.name, azurerm_linux_virtual_machine.linux_vm.*.private_ip_address)
}

output "linux_virtual_machine_ids" {
  description = "The resource id's of all Linux Virtual Machine."
  value       = concat(azurerm_linux_virtual_machine.linux_vm.*.id, [""])
}
output "vm_availability_set_id" {
  description = "The resource ID of Virtual Machine availability set"
  value       = var.enable_vm_availability_set == true ? element(concat(azurerm_availability_set.aset.*.id, [""]), 0) : null
}

output "linux_virtual_machine_name" {
  description = "The name of all Linux Virtual Machine."
  value       = concat(azurerm_linux_virtual_machine.linux_vm.*.name, [""])
}