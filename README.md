<!-- BEGIN DOTGIT-SYNC BLOCK MANAGED -->
<!-- markdownlint-disable -->
# 👋 Welcome to OpenTofu Module Cloudflare DNS

<center>

> ⚠️ IMPORTANT !
>
> Main repo is on [framagit.org](https://framagit.org/rdeville-public/opentofu/cloudflare-groups).
>
> On other online git platforms, they are just mirror of the main repo.
>
> Any issues, pull/merge requests, etc., might not be considered on those other
> platforms.

</center>

---

<center>

[![Licenses: (MIT OR BEERWARE)][license_badge]][license_url]
[![Changelog][changelog_badge]][changelog_badge_url]
[![Build][build_badge]][build_badge_url]
[![Release][release_badge]][release_badge_url]

</center>

[build_badge]: https://framagit.org/rdeville-public/opentofu/cloudflare-groups/badges/main/pipeline.svg
[build_badge_url]: https://framagit.org/rdeville-public/opentofu/cloudflare-groups/-/commits/main
[release_badge]: https://framagit.org/rdeville-public/opentofu/cloudflare-groups/-/badges/release.svg
[release_badge_url]: https://framagit.org/rdeville-public/opentofu/cloudflare-groups/-/releases/
[license_badge]: https://img.shields.io/badge/Licenses-MIT%20OR%20BEERWARE-blue
[license_url]: https://framagit.org/rdeville-public/opentofu/cloudflare-groups/blob/main/LICENSE
[changelog_badge]: https://img.shields.io/badge/Changelog-Python%20Semantic%20Release-yellow
[changelog_badge_url]: https://github.com/python-semantic-release/python-semantic-release

OpenTofu modules allowing to manage cloudflare dns configuration.

---
<!-- BEGIN DOTGIT-SYNC BLOCK EXCLUDED CUSTOM_README -->
## 🚀 Usage

### Deploy Zone with all default

```hcl
module "dns_zone" {
  source = git::https://framagit.org/rdeville-public/opentofu/module-cloudflare-dns.git

  # Required variables
  account_id = "1234567890abcdef"
  name       = "domain.tld"
}
```

### Deploy Zone with settings

```hcl
module "dns_zone" {
  source = git::https://framagit.org/rdeville-public/opentofu/module-cloudflare-dns.git

  # Required variables
  account_id = "1234567890abcdef"
  name       = "domain.tld"

  # Example variable
  type = "partial"
  vanity_name_servers = []
  zone_settings = {
    always_online = {
      value = "on"
    }
  }
}
```

### Deploy Zone DNSSEC Settings

```hcl
module "dns_zone" {
  source = git::https://framagit.org/rdeville-public/opentofu/module-cloudflare-dns.git

  # Required variables
  account_id = "1234567890abcdef"
  name       = "domain.tld"

  # Example values
  zone_dnssec_status       = "active"
  zone_dnssec_presigned    = false
  zone_dnssec_multi_signer = false
}
```

### Deploy Zone Cache Reserve

```hcl
module "dns_zone" {
  source = git::https://framagit.org/rdeville-public/opentofu/module-cloudflare-dns.git

  # Required variables
  account_id = "1234567890abcdef"
  name       = "domain.tld"

  # Example values
  zone_cache_reserve = "off"
}
```

### Deploy Zone Cache Variants

```hcl
module "dns_zone" {
  source = git::https://framagit.org/rdeville-public/opentofu/module-cloudflare-dns.git

  # Required variables
  account_id = "1234567890abcdef"
  name       = "domain.tld"

  # Example values
  zone_cache_variants = {
    avif = ["image/webp", "image/jpeg"]
    bmp  = ["image/webp", "image/jpeg"]
    gif  = ["image/webp", "image/jpeg"]
    jp2  = ["image/webp", "image/avif"]
    jpeg = ["image/webp", "image/avif"]
    jpg  = ["image/webp", "image/avif"]
    jpg2 = ["image/webp", "image/avif"]
    png  = ["image/webp", "image/avif"]
    tif  = ["image/webp", "image/avif"]
    tiff = ["image/webp", "image/avif"]
    webp = ["image/jpeg", "image/avif"]
  }
}
```

<!-- BEGIN TF-DOCS -->
## ⚙️ Module Content

<details><summary>Click to reveal</summary>

### Table of Content

* [Requirements](#requirements)
* [Resources](#resources)
* [Inputs](#inputs)
  * [Required Inputs](#required-inputs)
  * [Optional Inputs](#optional-inputs)
* [Outputs](#outputs)

### Requirements

* [opentofu](https://opentofu.org/docs/):
  `>= 1.8, < 2.0`
* [cloudflare](https://search.opentofu.org/provider/cloudflare/cloudflare/):
  `~>5.0`

### Resources

* [resource.cloudflare_zone.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone)
  > Manage Zone
* [resource.cloudflare_zone_cache_reserve.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone_cache_reserve)
  > Manage Zone Cache Reserve
* [resource.cloudflare_zone_cache_variants.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone_cache_variants)
  > Manage Zone Cache Variants
* [resource.cloudflare_zone_dnssec.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone_dnssec)
  > Manage Zone DNSSEC
* [resource.cloudflare_zone_setting.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone_setting)
  > Manage Zone settings

<!-- markdownlint-capture -->
### Inputs

<!-- markdownlint-disable -->
#### Required Inputs

* [account_id](#account_id)
* [name](#name)

##### `account_id`

ID of the account to use
<div style="display:inline-block;width:100%;">
<div style="float:left;border-color:#FFFFFF;width:75%;">
<details><summary>Type</summary>

```hcl
string
```

</details>
</div>
</div>

##### `name`

The domain name (does not end with dot, ex: domain.tld)
<div style="display:inline-block;width:100%;">
<div style="float:left;border-color:#FFFFFF;width:75%;">
<details><summary>Type</summary>

```hcl
string
```

</details>
</div>
</div>

#### Optional Inputs

* [type](#type)
* [vanity_name_servers](#vanity_name_servers)
* [zone_settings](#zone_settings)
* [zone_dnssec_status](#zone_dnssec_status)
* [zone_dnssec_multi_signer](#zone_dnssec_multi_signer)
* [zone_dnssec_presigned](#zone_dnssec_presigned)
* [zone_cache_reserve](#zone_cache_reserve)
* [zone_cache_variants](#zone_cache_variants)


##### `type`

A 'full' zone implies that DNS is hosted with Cloudflare.
A 'partial' zone is typically a partner-hosted zone or a CNAME setup.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  full
  ```

  </div>
</details>

##### `vanity_name_servers`

An array of domains used for custom name servers.
This is only available for Business and Enterprise plans.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  list(string)
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  []
  ```

  </div>
</details>

##### `zone_settings`

Map of object, where keys are the Settings ID, e.g. 'always_online' and
object support following attributes:
  * `value`: String, the value to set for the setting
  * `id`: String, optional, the ID of the zone settings, default to `null`

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  map(object({
    id    = optional(string, null)
    value = string
  }))
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  {}
  ```

  </div>
</details>

##### `zone_dnssec_status`

Status of DNSSEC, based on user-desired state and presence of necessary
records.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  active
  ```

  </div>
</details>

##### `zone_dnssec_multi_signer`

If true, multi-signer DNSSEC is enabled on the zone, allowing multiple
providers to serve a DNSSEC-signed zone at the same time.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `zone_dnssec_presigned`

If true, allows Cloudflare to transfer in a DNSSEC-signed zone including
signatures from an external provider, without requiring Cloudflare to sign any
records on the fly.

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  bool
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  false
  ```

  </div>
</details>

##### `zone_cache_reserve`

Value of the Cache Reserve zone setting.
<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  string
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  off
  ```

  </div>
</details>

##### `zone_cache_variants`

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

<details style="width: 100%;display: inline-block">
  <summary>Type & Default</summary>
  <div style="height: 1em"></div>
  <div style="width:64%; float:left;">
  <p style="border-bottom: 1px solid #333333;">Type</p>

  ```hcl
  object({
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
  ```

  </div>
  <div style="width:34%;float:right;">
  <p style="border-bottom: 1px solid #333333;">Default</p>

  ```hcl
  {}
  ```

  </div>
</details>
<!-- markdownlint-restore -->

### Outputs

* `zone_id`:
  ID of the deployed zone.

</details>

<!-- END TF-DOCS -->
<!-- END DOTGIT-SYNC BLOCK EXCLUDED CUSTOM_README -->
## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check [issues page][issues_pages].

You can also take a look at the [CONTRIBUTING.md][contributing].

[issues_pages]: https://framagit.org/rdeville-public/opentofu/cloudflare-groups/-/issues
[contributing]: https://framagit.org/rdeville-public/opentofu/cloudflare-groups/blob/main/CONTRIBUTING.md

## 👤 Maintainers

* 📧 [**Romain Deville** \<code@romaindeville.fr\>](mailto:code@romaindeville.fr)
  * Website: [https://romaindeville.fr](https://romaindeville.fr)
  * Cloudflare: [@rdeville](https://cloudflare.com/rdeville)
  * Gitlab: [@r.deville](https://gitlab.com/r.deville)
  * Framagit: [@rdeville](https://framagit.org/rdeville)

## 📝 License

Copyright © 2024 - 2025
 * [Romain Deville \<code@romaindeville.fr\>](code@romaindeville.fr)

This project is under following licenses (**OR**) :

* [MIT][main_license]
* [BEERWARE][beerware_license]

[main_license]: https://framagit.org/rdeville-public/opentofu/cloudflare-groups/blob/main/LICENSE
[beerware_license]: https://framagit.org/rdeville-public/opentofu/cloudflare-groups/blob/main/LICENSE.BEERWARE
<!-- END DOTGIT-SYNC BLOCK MANAGED -->
