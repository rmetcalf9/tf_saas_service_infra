variable "ws_name" {
  description = "Name of webservice"
}

variable "major_version" {
  description = "Major version used in endpoints"
}

variable "major_version_deployment_config" {
  description = "Describes the current test and main versions for THIS major version"
  type = object({
    main_version = string,
    test_version = string
  })
}

variable "include_test_public" {
  description = "Should the main public endpoint be included"
  type = bool
  default = true
}

variable "include_test_private" {
  description = "Should the main public endpoint be included"
  type = bool
  default = true
}

variable "include_main_public" {
  description = "Should the main public endpoint be included"
  type = bool
  default = true
}

variable "include_main_private" {
  description = "Should the main public endpoint be included"
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

variable "tenant_path_position_main_private" {
  description = "The position in the url that the tenant appears for securing the main endpoint"
  type = number
  default = 7
}

variable "tenant_path_position_test_private" {
  description = "The position in the url that the tenant appears for securing the main endpoint"
  type = number
  default = 7
}
