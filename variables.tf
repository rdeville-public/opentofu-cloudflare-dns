# Zone Settings Variables
# ------------------------------------------------------------------------
variable "account_id" {
  type        = string
  description = "ID of the account to use"
}

variable "name" {
  type        = string
  description = "The domain name (does not end with dot, ex: domain.tld)"

  validation {
    condition     = endswith(var.name, ".") == true
    error_message = "Domain name must not end with dot."
  }
}

variable "type" {
  type        = string
  description = <<-EOM
  A 'full' zone implies that DNS is hosted with Cloudflare.
  A 'partial' zone is typically a partner-hosted zone or a CNAME setup.
  EOM

  nullable = false
  default  = "full"
}

variable "vanity_name_servers" {
  type        = list(string)
  description = <<-EOM
  An array of domains used for custom name servers.
  This is only available for Business and Enterprise plans.
  EOM

  nullable = false
  default  = []
}

variable "zone_settings" {
  type = map(object({
    id    = optional(string, null)
    value = string
  }))
  description = <<-EOM
  Map of object, where keys are the Settings ID, e.g. 'always_online' and
  object support following attributes:
    * `value`: String, the value to set for the setting
    * `id`: String, optional, the ID of the zone settings, default to `null`
  EOM

  nullable = false
  default  = {}
}

variable "zone_dnssec_status" {
  type        = string
  description = <<-EOM
  Status of DNSSEC, based on user-desired state and presence of necessary
  records.
  EOM

  nullable = false
  default  = "active"
}

variable "zone_dnssec_multi_signer" {
  type        = bool
  description = <<-EOM
  If true, multi-signer DNSSEC is enabled on the zone, allowing multiple
  providers to serve a DNSSEC-signed zone at the same time.
  EOM

  nullable = false
  default  = false
}

variable "zone_dnssec_presigned" {
  type        = bool
  description = <<-EOM
  If true, allows Cloudflare to transfer in a DNSSEC-signed zone including
  signatures from an external provider, without requiring Cloudflare to sign any
  records on the fly.
  EOM

  nullable = false
  default  = false
}

variable "zone_cache_reserve" {
  type        = string
  description = "Value of the Cache Reserve zone setting."

  nullable = false
  default  = "off"
}

variable "zone_cache_variants" {
  type = object({
    avif = optional(list(string), [])
    bmp  = optional(list(string), [])
    gif  = optional(list(string), [])
    jp2  = optional(list(string), [])
    jpeg = optional(list(string), [])
    jpg  = optional(list(string), [])
    jpg2 = optional(list(string), [])
    png  = optional(list(string), [])
    tif  = optional(list(string), [])
    tiff = optional(list(string), [])
    webp = optional(list(string), [])
  })
  description = <<-EOM
  Object supporting following attributes:
    - `avif`: Optional, List of strings with the MIME types of all the variants
      that should be served for `avif`, default `[]`.
    - `bmp`: Optional, List of strings with the MIME types of all the variants
      that should be served for `bmp`, default `[]`.
    - `gif`: Optional, List of strings with the MIME types of all the variants
      that should be served for `gif`, default `[]`.
    - `jp2`: Optional, List of strings with the MIME types of all the variants
      that should be served for `jp2`, default `[]`.
    - `jpeg`: Optional, List of strings with the MIME types of all the variants
      that should be served for `jpeg`, default `[]`.
    - `jpg`: Optional, List of strings with the MIME types of all the variants
      that should be served for `jpg`, default `[]`.
    - `jpg2`: Optional, List of strings with the MIME types of all the variants
      that should be served for `jpg2`, default `[]`.
    - `png`: Optional, List of strings with the MIME types of all the variants
      that should be served for `png`, default `[]`.
    - `tif`: Optional, List of strings with the MIME types of all the variants
      that should be served for `tif`, default `[]`.
    - `tiff`: Optional, List of strings with the MIME types of all the variants
      that should be served for `tiff`, default `[]`.
    - `webp`: Optional, List of strings with the MIME types of all the variants
      that should be served for `webp`, default `[]`.
  EOM

  nullable = false
  default  = {}
}
