# output.tf

output "upstream" {
  value = (var.include_main_public || var.include_main_private) ? kong_upstream.upstream : null
}
