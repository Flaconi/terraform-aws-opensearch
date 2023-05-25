locals {
  roles = merge({
    for filename in var.role_files :
    replace(basename(filename), "/\\.(ya?ml|json)$/", "") =>
    length(regexall("\\.ya?ml$", filename)) > 0 ? yamldecode(file(filename)) : jsondecode(file(filename))
  }, var.roles)

  role_mappings = merge({
    for filename in var.role_mapping_files :
    replace(basename(filename), "/\\.(ya?ml|json)$/", "") =>
    length(regexall("\\.ya?ml$", filename)) > 0 ? yamldecode(file(filename)) : jsondecode(file(filename))
  }, var.role_mappings)

  custom_endpoint = var.custom_endpoint != null ? var.custom_endpoint : "${var.cluster_name}.${data.aws_route53_zone.opensearch.name}"
}
