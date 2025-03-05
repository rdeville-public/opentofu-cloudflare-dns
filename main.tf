# Manage Zone
resource "cloudflare_zone" "this" {
  account = {
    id = var.account_id
  }

  name                = var.name
  type                = var.type
  vanity_name_servers = var.vanity_name_servers
}

# Manage Zone settings
resource "cloudflare_zone_setting" "this" {
  for_each = var.zone_settings

  zone_id = cloudflare_zone.this.id

  setting_id = each.key
  id         = each.value.id
  value      = each.value.value
}

# Manage Zone DNSSEC
resource "cloudflare_zone_dnssec" "this" {
  zone_id = cloudflare_zone.this.id

  status              = var.zone_dnssec_status
  dnssec_multi_signer = var.zone_dnssec_multi_signer
  dnssec_presigned    = var.zone_dnssec_presigned
}

# Manage Zone Cache Reserve
resource "cloudflare_zone_cache_reserve" "this" {
  zone_id = cloudflare_zone.this.id

  value = var.zone_cache_reserve
}

# Manage Zone Cache Variants
resource "cloudflare_zone_cache_variants" "this" {
  zone_id = cloudflare_zone.this.id

  value = var.zone_cache_variants
}
