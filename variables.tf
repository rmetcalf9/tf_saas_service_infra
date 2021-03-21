# variables.tf

variable "ws_name" {
  description = "Name of webservice"
}

variable "deployment_config" {
  description = "Describes the current test and main versions for each major version"
  type = object({
    major_versions = map(
      object({
        main_version = string,
        test_version = string
      })
    )
  })
}

variable "include_test_public" {
  description = "Should the test public endpoint be included"
  type = bool
  default = true
}

variable "include_test_private" {
  description = "Should the test private endpoint be included"
  type = bool
  default = true
}

variable "include_main_public" {
  description = "Should the main public endpoint be included"
  type = bool
  default = true
}

variable "include_main_private" {
  description = "Should the main private endpoint be included"
  type = bool
  default = true
}

variable "secure_test_private" {
  description = "Should the test public endpoint be secured with JWT and ACL"
  type = bool
  default = true
}

variable "secure_main_private" {
  description = "Should the main public endpoint be secured with JWT and ACL"
  type = bool
  default = true
}

variable "private_allow_tenant_role_whitelist" {
  description = "List of tenant and roles required to access private endpoint (Default is no restriction)"
  type    = list(string)
  default = []
}

# *********************************
# mainurl control Parameters
# *********************************

variable "mainurl_include" {
  description = "Should a route to the main url be included"
  default = false
}
variable "mainurl" {
  default = "mustbereplaced34trfesdadg.com"
  description = "Main URL for this service"
}
variable "mainurl_majorversion" {
  description = "Which major version should the main url point to"
  default = "0"
}
variable "mainurl_destpath" {
  description = "Path that main url should point to"
  default = "/public/web/frontend/"
}

