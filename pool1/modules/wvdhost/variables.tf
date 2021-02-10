variable "owner" {
  type = string
}

variable "vm" {
  type = object({
    location             = string
    resource_group_name  = string
    name                 = string
    size                 = string
    storage_account_type = string
    license_type         = string
    image_publisher      = string
    image_offer          = string
    image_sku            = string
    image_version        = string
    image_id             = string
    subnet_id            = string
    gpu_driver           = string
  })
}

variable "adjoin" {
  type = object({
    name     = string
    domain   = string
    password = string
  })
  sensitive = true
}

variable "hpjoin" {
  type = object({
    name  = string
    token = string
    url   = string
  })
  sensitive = true
}

variable "agjoin" {
  type = object({
    id = string
  })
}
