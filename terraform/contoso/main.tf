module "rgs" {
  source = "../../modules/rg"

  for_each = var.resource_groups #var.rgs_contoso

  rg_name  = each.key
  location = each.value.location
}