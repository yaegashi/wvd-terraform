variable "workspace" {
  type = object({
    name     = string
    location = string
  })
  default = {
    name     = "Workspace"
    location = "westus2"
  }
}
