# Terraform Module for OpenSearch

<!-- Uncomment and replace with your module name
[![lint](https://github.com/flaconi/<MODULENAME>/workflows/lint/badge.svg)](https://github.com/flaconi/<MODULENAME>/actions?query=workflow%3Alint)
[![test](https://github.com/flaconi/<MODULENAME>/workflows/test/badge.svg)](https://github.com/flaconi/<MODULENAME>/actions?query=workflow%3Atest)
[![Tag](https://img.shields.io/github/tag/flaconi/<MODULENAME>.svg)](https://github.com/flaconi/<MODULENAME>/releases)
-->
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm"></a> [acm](#module\_acm) | terraform-aws-modules/acm/aws | ~> 4.3.1 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_service_linked_role.es](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_service_linked_role) | resource |
| [aws_kms_key.opensearch_encryption_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_opensearch_domain.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearch_domain) | resource |
| [aws_opensearch_domain_saml_options.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/opensearch_domain_saml_options) | resource |
| [aws_route53_record.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.access_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_route53_zone.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_domain"></a> [cluster\_domain](#input\_cluster\_domain) | The hosted zone name of the OpenSearch cluster. | `string` | n/a | yes |
| <a name="input_access_policies"></a> [access\_policies](#input\_access\_policies) | IAM policy document specifying the access policies for the domain. | `string` | `null` | no |
| <a name="input_advanced_options"></a> [advanced\_options](#input\_advanced\_options) | Key-value string pairs to specify advanced configuration options. | `map(string)` | `{}` | no |
| <a name="input_advanced_security_options_enabled"></a> [advanced\_security\_options\_enabled](#input\_advanced\_security\_options\_enabled) | Whether advanced security is enabled. | `bool` | `true` | no |
| <a name="input_advanced_security_options_internal_user_database_enabled"></a> [advanced\_security\_options\_internal\_user\_database\_enabled](#input\_advanced\_security\_options\_internal\_user\_database\_enabled) | Whether to enable or not internal Kibana user database for ELK OpenDistro security plugin | `bool` | `true` | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | The number of availability zones for the OpenSearch cluster. Valid values: 1, 2 or 3. | `number` | `3` | no |
| <a name="input_cluster_domain_private"></a> [cluster\_domain\_private](#input\_cluster\_domain\_private) | Indicates whether to create records in a private (true) or public (false) zone | `bool` | `false` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the OpenSearch cluster. | `string` | `"opensearch"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The version of OpenSearch to deploy. | `string` | `"1.0"` | no |
| <a name="input_create_service_role"></a> [create\_service\_role](#input\_create\_service\_role) | Indicates whether to create the service-linked role. See https://docs.aws.amazon.com/opensearch-service/latest/developerguide/slr.html | `bool` | `true` | no |
| <a name="input_custom_endpoint"></a> [custom\_endpoint](#input\_custom\_endpoint) | Fully qualified domain for your custom endpoint. If not specified, then it defaults to <cluster\_name>.<cluster\_domain> | `string` | `null` | no |
| <a name="input_custom_endpoint_certificate_arn"></a> [custom\_endpoint\_certificate\_arn](#input\_custom\_endpoint\_certificate\_arn) | The ARN of the custom ACM certificate. | `string` | `""` | no |
| <a name="input_ebs_enabled"></a> [ebs\_enabled](#input\_ebs\_enabled) | Indicates whether attach EBS volumes to the data nodes. | `bool` | `false` | no |
| <a name="input_ebs_iops"></a> [ebs\_iops](#input\_ebs\_iops) | The baseline input/output (I/O) performance of EBS volumes attached to data nodes. | `number` | `3000` | no |
| <a name="input_ebs_throughput"></a> [ebs\_throughput](#input\_ebs\_throughput) | The throughput (in MiB/s) of the EBS volumes attached to data nodes. Valid values are between 125 and 1000. | `number` | `125` | no |
| <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size) | The size of EBS volumes attached to data nodes (in GiB). | `number` | `10` | no |
| <a name="input_ebs_volume_type"></a> [ebs\_volume\_type](#input\_ebs\_volume\_type) | The type of EBS volumes attached to data nodes. | `string` | `"gp3"` | no |
| <a name="input_encrypt_kms_key_id"></a> [encrypt\_kms\_key\_id](#input\_encrypt\_kms\_key\_id) | The KMS key ID to encrypt the OpenSearch cluster with. If not specified, then it defaults to using the AWS OpenSearch Service KMS key. | `string` | `""` | no |
| <a name="input_hot_instance_count"></a> [hot\_instance\_count](#input\_hot\_instance\_count) | The number of dedicated hot nodes in the cluster. | `number` | `3` | no |
| <a name="input_hot_instance_type"></a> [hot\_instance\_type](#input\_hot\_instance\_type) | The type of EC2 instances to run for each hot node. A list of available instance types can you find at https://aws.amazon.com/en/opensearch-service/pricing/#On-Demand_instance_pricing | `string` | `"r6gd.4xlarge.search"` | no |
| <a name="input_master_instance_count"></a> [master\_instance\_count](#input\_master\_instance\_count) | The number of dedicated master nodes in the cluster. | `number` | `3` | no |
| <a name="input_master_instance_enabled"></a> [master\_instance\_enabled](#input\_master\_instance\_enabled) | Indicates whether dedicated master nodes are enabled for the cluster. | `bool` | `true` | no |
| <a name="input_master_instance_type"></a> [master\_instance\_type](#input\_master\_instance\_type) | The type of EC2 instances to run for each master node. A list of available instance types can you find at https://aws.amazon.com/en/opensearch-service/pricing/#On-Demand_instance_pricing | `string` | `"r6gd.large.search"` | no |
| <a name="input_master_user_name"></a> [master\_user\_name](#input\_master\_user\_name) | The master user of the cluster. | `string` | `""` | no |
| <a name="input_master_user_password"></a> [master\_user\_password](#input\_master\_user\_password) | The master password of the cluster. | `string` | `""` | no |
| <a name="input_saml_enabled"></a> [saml\_enabled](#input\_saml\_enabled) | Indicates whether to configure SAML for the OpenSearch dashboard. | `bool` | `true` | no |
| <a name="input_saml_entity_id"></a> [saml\_entity\_id](#input\_saml\_entity\_id) | The unique Entity ID of the application in SAML Identity Provider. | `string` | `""` | no |
| <a name="input_saml_master_backend_role"></a> [saml\_master\_backend\_role](#input\_saml\_master\_backend\_role) | This backend role receives full permissions to the cluster, equivalent to a new master role, but can only use those permissions within Dashboards. | `string` | `null` | no |
| <a name="input_saml_master_user_name"></a> [saml\_master\_user\_name](#input\_saml\_master\_user\_name) | This username receives full permissions to the cluster, equivalent to a new master user, but can only use those permissions within Dashboards. | `string` | `null` | no |
| <a name="input_saml_metadata_content"></a> [saml\_metadata\_content](#input\_saml\_metadata\_content) | The metadata of the SAML application in xml format. | `string` | `""` | no |
| <a name="input_saml_roles_key"></a> [saml\_roles\_key](#input\_saml\_roles\_key) | Element of the SAML assertion to use for backend roles. | `string` | `"http://schemas.microsoft.com/ws/2008/06/identity/claims/role"` | no |
| <a name="input_saml_session_timeout"></a> [saml\_session\_timeout](#input\_saml\_session\_timeout) | Duration of a session in minutes after a user logs in. Default is 60. Maximum value is 1,440. | `number` | `60` | no |
| <a name="input_saml_subject_key"></a> [saml\_subject\_key](#input\_saml\_subject\_key) | Element of the SAML assertion to use for username. | `string` | `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| <a name="input_warm_instance_count"></a> [warm\_instance\_count](#input\_warm\_instance\_count) | The number of dedicated warm nodes in the cluster. | `number` | `3` | no |
| <a name="input_warm_instance_enabled"></a> [warm\_instance\_enabled](#input\_warm\_instance\_enabled) | Indicates whether ultrawarm nodes are enabled for the cluster. | `bool` | `true` | no |
| <a name="input_warm_instance_type"></a> [warm\_instance\_type](#input\_warm\_instance\_type) | The type of EC2 instances to run for each warm node. A list of available instance types can you find at https://aws.amazon.com/en/elasticsearch-service/pricing/#UltraWarm_pricing | `string` | `"ultrawarm1.large.search"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | The endpoint URL of the OpenSearch cluster. |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The name of the OpenSearch cluster. |
| <a name="output_cluster_version"></a> [cluster\_version](#output\_cluster\_version) | The version of the OpenSearch cluster. |
| <a name="output_kibana_endpoint"></a> [kibana\_endpoint](#output\_kibana\_endpoint) | The endpoint URL of the OpenSearch dashboards. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## License

**[MIT License](LICENSE)**

Copyright (c) 2022 **[Flaconi GmbH](https://github.com/flaconi)**
