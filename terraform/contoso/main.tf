module "rgs" {
  source = "../modules/rg"

  for_each = var.resource_groups #var.rgs_contoso

  rg_name  = each.key
  location = each.value.location
}

# module "vnets" {
#   source   = "../../modules/vnet"
#   for_each = var.virtual_networks

#   vnet_name           = each.key
#   resource_group_name = each.value.resource_group_name
#   location            = each.value.location
#   address_space       = each.value.address_space
#   subnets             = lookup(each.value, "subnets", {})
#   #nsg_ids             = module.nsg.nsg_id
#   depends_on = [
#     module.rgs
#   ]
# }

# module "virtual-machine" {
#   source = "../../modules/count-vm"

#   for_each = var.virtual_machines_linux

#   virtual_machine_name             = each.key
#   resource_group_name              = each.value.resource_group_name
#   location                         = each.value.location
#   virtual_network_name             = each.value.virtual_network_name
#   subnet_name                      = each.value.subnet_name
#   virtual_machine_size             = each.value.virtual_machine_size
#   instances_count                  = each.value.instances_count
#   admin_username                   = each.value.admin_username
#   public_key                       = each.value.public_key
#   enable_proximity_placement_group = each.value.enable_proximity_placement_group
#   enable_vm_availability_set       = each.value.enable_vm_availability_set
#   enable_public_ip_address         = each.value.enable_public_ip_address
#   img_publisher                    = each.value.img_publisher
#   img_offer                        = each.value.img_offer
#   img_sku                          = each.value.img_sku
#   img_version                      = each.value.img_version
#   data_disks                       = each.value.data_disks
#   tags                             = each.value.tags
#   vm_extension_enabled             = each.value.vm_extension_enabled
#   extension_name                   = each.value.extension_name
#   network_watcher_enabled          = each.value.network_watcher_enabled
#   network_watcher_name             = each.value.network_watcher_name
#   log_analytics_workspace_enabled  = each.value.log_analytics_workspace_enabled
#   analytics_workspace_name         = each.value.analytics_workspace_name
#   connection_monitor_enabled       = each.value.connection_monitor_enabled
#   connection_monitor_name          = each.value.connection_monitor_name
#   endpoint                         = each.value.endpoint
#   test_configuration               = each.value.test_configuration
#   test_group                       = each.value.test_group

#   depends_on = [
#     module.rgs, module.vnets
#   ]
# }