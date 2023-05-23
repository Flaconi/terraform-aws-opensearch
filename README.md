# Terraform Module for OpenSearch

<!-- Uncomment and replace with your module name
[![lint](https://github.com/flaconi/<MODULENAME>/workflows/lint/badge.svg)](https://github.com/flaconi/<MODULENAME>/actions?query=workflow%3Alint)
[![test](https://github.com/flaconi/<MODULENAME>/workflows/test/badge.svg)](https://github.com/flaconi/<MODULENAME>/actions?query=workflow%3Atest)
[![Tag](https://img.shields.io/github/tag/flaconi/<MODULENAME>.svg)](https://github.com/flaconi/<MODULENAME>/releases)
-->
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

<!-- TFDOCS_HEADER_START -->


<!-- TFDOCS_HEADER_END -->

<!-- TFDOCS_PROVIDER_START -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

<!-- TFDOCS_PROVIDER_END -->

<!-- TFDOCS_REQUIREMENTS_START -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |

<!-- TFDOCS_REQUIREMENTS_END -->

<!-- TFDOCS_INPUTS_START -->
## Required Inputs

The following input variables are required:

### <a name="input_cluster_domain"></a> [cluster\_domain](#input\_cluster\_domain)

Description: The hosted zone name of the OpenSearch cluster.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name)

Description: The name of the OpenSearch cluster.

Type: `string`

Default: `"opensearch"`

### <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version)

Description: The version of OpenSearch to deploy.

Type: `string`

Default: `"1.0"`

### <a name="input_cluster_domain_private"></a> [cluster\_domain\_private](#input\_cluster\_domain\_private)

Description: Indicates whether to create records in a private (true) or public (false) zone

Type: `bool`

Default: `false`

### <a name="input_create_service_role"></a> [create\_service\_role](#input\_create\_service\_role)

Description: Indicates whether to create the service-linked role. See https://docs.aws.amazon.com/opensearch-service/latest/developerguide/slr.html

Type: `bool`

Default: `true`

### <a name="input_master_user_name"></a> [master\_user\_name](#input\_master\_user\_name)

Description: The master user of the cluster.

Type: `string`

Default: `""`

### <a name="input_master_user_password"></a> [master\_user\_password](#input\_master\_user\_password)

Description: The master password of the cluster.

Type: `string`

Default: `""`

### <a name="input_master_instance_enabled"></a> [master\_instance\_enabled](#input\_master\_instance\_enabled)

Description: Indicates whether dedicated master nodes are enabled for the cluster.

Type: `bool`

Default: `true`

### <a name="input_master_instance_type"></a> [master\_instance\_type](#input\_master\_instance\_type)

Description: The type of EC2 instances to run for each master node. A list of available instance types can you find at https://aws.amazon.com/en/opensearch-service/pricing/#On-Demand_instance_pricing

Type: `string`

Default: `"r6gd.large.search"`

### <a name="input_master_instance_count"></a> [master\_instance\_count](#input\_master\_instance\_count)

Description: The number of dedicated master nodes in the cluster.

Type: `number`

Default: `3`

### <a name="input_hot_instance_type"></a> [hot\_instance\_type](#input\_hot\_instance\_type)

Description: The type of EC2 instances to run for each hot node. A list of available instance types can you find at https://aws.amazon.com/en/opensearch-service/pricing/#On-Demand_instance_pricing

Type: `string`

Default: `"r6gd.4xlarge.search"`

### <a name="input_hot_instance_count"></a> [hot\_instance\_count](#input\_hot\_instance\_count)

Description: The number of dedicated hot nodes in the cluster.

Type: `number`

Default: `3`

### <a name="input_warm_instance_enabled"></a> [warm\_instance\_enabled](#input\_warm\_instance\_enabled)

Description: Indicates whether ultrawarm nodes are enabled for the cluster.

Type: `bool`

Default: `true`

### <a name="input_warm_instance_type"></a> [warm\_instance\_type](#input\_warm\_instance\_type)

Description: The type of EC2 instances to run for each warm node. A list of available instance types can you find at https://aws.amazon.com/en/elasticsearch-service/pricing/#UltraWarm_pricing

Type: `string`

Default: `"ultrawarm1.large.search"`

### <a name="input_warm_instance_count"></a> [warm\_instance\_count](#input\_warm\_instance\_count)

Description: The number of dedicated warm nodes in the cluster.

Type: `number`

Default: `3`

### <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones)

Description: The number of availability zones for the OpenSearch cluster. Valid values: 1, 2 or 3.

Type: `number`

Default: `3`

### <a name="input_ebs_enabled"></a> [ebs\_enabled](#input\_ebs\_enabled)

Description: Indicates whether attach EBS volumes to the data nodes.

Type: `bool`

Default: `false`

### <a name="input_ebs_volume_size"></a> [ebs\_volume\_size](#input\_ebs\_volume\_size)

Description: The size of EBS volumes attached to data nodes (in GiB).

Type: `number`

Default: `10`

### <a name="input_ebs_volume_type"></a> [ebs\_volume\_type](#input\_ebs\_volume\_type)

Description: The type of EBS volumes attached to data nodes.

Type: `string`

Default: `"gp3"`

### <a name="input_ebs_throughput"></a> [ebs\_throughput](#input\_ebs\_throughput)

Description: The throughput (in MiB/s) of the EBS volumes attached to data nodes. Valid values are between 125 and 1000.

Type: `number`

Default: `125`

### <a name="input_ebs_iops"></a> [ebs\_iops](#input\_ebs\_iops)

Description: The baseline input/output (I/O) performance of EBS volumes attached to data nodes.

Type: `number`

Default: `3000`

### <a name="input_encrypt_kms_key_id"></a> [encrypt\_kms\_key\_id](#input\_encrypt\_kms\_key\_id)

Description: The KMS key ID to encrypt the OpenSearch cluster with. If not specified, then it defaults to using the AWS OpenSearch Service KMS key.

Type: `string`

Default: `""`

### <a name="input_saml_enabled"></a> [saml\_enabled](#input\_saml\_enabled)

Description: Indicates whether to configure SAML for the OpenSearch dashboard.

Type: `bool`

Default: `true`

### <a name="input_saml_subject_key"></a> [saml\_subject\_key](#input\_saml\_subject\_key)

Description: Element of the SAML assertion to use for username.

Type: `string`

Default: `"http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name"`

### <a name="input_saml_roles_key"></a> [saml\_roles\_key](#input\_saml\_roles\_key)

Description: Element of the SAML assertion to use for backend roles.

Type: `string`

Default: `"http://schemas.microsoft.com/ws/2008/06/identity/claims/role"`

### <a name="input_saml_entity_id"></a> [saml\_entity\_id](#input\_saml\_entity\_id)

Description: The unique Entity ID of the application in SAML Identity Provider.

Type: `string`

Default: `""`

### <a name="input_saml_metadata_content"></a> [saml\_metadata\_content](#input\_saml\_metadata\_content)

Description: The metadata of the SAML application in xml format.

Type: `string`

Default: `""`

### <a name="input_saml_session_timeout"></a> [saml\_session\_timeout](#input\_saml\_session\_timeout)

Description: Duration of a session in minutes after a user logs in. Default is 60. Maximum value is 1,440.

Type: `number`

Default: `60`

### <a name="input_saml_master_backend_role"></a> [saml\_master\_backend\_role](#input\_saml\_master\_backend\_role)

Description: This backend role receives full permissions to the cluster, equivalent to a new master role, but can only use those permissions within Dashboards.

Type: `string`

Default: `null`

### <a name="input_saml_master_user_name"></a> [saml\_master\_user\_name](#input\_saml\_master\_user\_name)

Description: This username receives full permissions to the cluster, equivalent to a new master user, but can only use those permissions within Dashboards.

Type: `string`

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A map of tags to add to all resources.

Type: `map(string)`

Default: `{}`

### <a name="input_custom_endpoint_certificate_arn"></a> [custom\_endpoint\_certificate\_arn](#input\_custom\_endpoint\_certificate\_arn)

Description: The ARN of the custom ACM certificate.

Type: `string`

Default: `""`

### <a name="input_advanced_options"></a> [advanced\_options](#input\_advanced\_options)

Description: Key-value string pairs to specify advanced configuration options.

Type: `map(string)`

Default: `{}`

### <a name="input_advanced_security_options_enabled"></a> [advanced\_security\_options\_enabled](#input\_advanced\_security\_options\_enabled)

Description: Whether advanced security is enabled.

Type: `bool`

Default: `true`

### <a name="input_access_policies"></a> [access\_policies](#input\_access\_policies)

Description: IAM policy document specifying the access policies for the domain.

Type: `string`

Default: `null`

<!-- TFDOCS_INPUTS_END -->

<!-- TFDOCS_OUTPUTS_START -->
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | The endpoint URL of the OpenSearch cluster. |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The name of the OpenSearch cluster. |
| <a name="output_cluster_version"></a> [cluster\_version](#output\_cluster\_version) | The version of the OpenSearch cluster. |
| <a name="output_kibana_endpoint"></a> [kibana\_endpoint](#output\_kibana\_endpoint) | The endpoint URL of the OpenSearch dashboards. |

<!-- TFDOCS_OUTPUTS_END -->

## License

**[MIT License](LICENSE)**

Copyright (c) 2022 **[Flaconi GmbH](https://github.com/flaconi)**
