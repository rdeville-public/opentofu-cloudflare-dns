# No output for now. Empty file to be compliant with TF standard module
# structure, see https://developer.hashicorp.com/terraform/language/modules/develop/structure
output "zone_id" {
  value       = cloudflare_zone.this.id
  description = "ID of the deployed zone."
}
