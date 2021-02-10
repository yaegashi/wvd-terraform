variable "wvd" {
  type = object({
    name            = string
    location        = string
    expiration_date = string
    workspace_id    = string
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
    url = string
  })
  default = {
    url = "https://wvdportalstorageblob.blob.core.windows.net/galleryartifacts/Configuration_10-26-2020.zip"
  }
}
