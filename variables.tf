variable "account_assume_role" {
  description = "A name of assume role used in the AWS account to execute terraform."
  type        = string
  default     = "ASSUME-ATLANTIS"
}

variable "cluster_name" {
  description = "The name of the OpenSearch cluster."
  type        = string
  default     = "opensearch"
}

variable "cluster_version" {
  description = "The version of OpenSearch to deploy."
  type        = string
  default     = "1.0"
}

variable "cluster_domain" {
  description = "The hosted zone name of the OpenSearch cluster."
  type        = string
}

variable "cluster_domain_private" {
  description = "Indicates whether to create records in a private (true) or public (false) zone"
  type        = bool
  default     = false
}

variable "create_service_role" {
  description = "Indicates whether to create the service-linked role. See https://docs.aws.amazon.com/opensearch-service/latest/developerguide/slr.html"
  type        = bool
  default     = true
}

variable "master_user_name" {
  description = "The master user of the cluster."
  type        = string
  default     = ""
}

variable "master_user_password" {
  description = "The master password of the cluster."
  type        = string
  default     = ""
}

variable "master_instance_enabled" {
  description = "Indicates whether dedicated master nodes are enabled for the cluster."
  type        = bool
  default     = true
}

variable "master_instance_type" {
  description = "The type of EC2 instances to run for each master node. A list of available instance types can you find at https://aws.amazon.com/en/opensearch-service/pricing/#On-Demand_instance_pricing"
  type        = string
  default     = "r6gd.large.search"
}

variable "master_instance_count" {
  description = "The number of dedicated master nodes in the cluster."
  type        = number
  default     = 3
}

variable "hot_instance_type" {
  description = "The type of EC2 instances to run for each hot node. A list of available instance types can you find at https://aws.amazon.com/en/opensearch-service/pricing/#On-Demand_instance_pricing"
  type        = string
  default     = "r6gd.4xlarge.search"
}

variable "hot_instance_count" {
  description = "The number of dedicated hot nodes in the cluster."
  type        = number
  default     = 3
}

variable "warm_instance_enabled" {
  description = "Indicates whether ultrawarm nodes are enabled for the cluster."
  type        = bool
  default     = true
}

variable "warm_instance_type" {
  description = "The type of EC2 instances to run for each warm node. A list of available instance types can you find at https://aws.amazon.com/en/elasticsearch-service/pricing/#UltraWarm_pricing"
  type        = string
  default     = "ultrawarm1.large.search"
}

variable "warm_instance_count" {
  description = "The number of dedicated warm nodes in the cluster."
  type        = number
  default     = 3
}

variable "availability_zones" {
  description = "The number of availability zones for the OpenSearch cluster. Valid values: 1, 2 or 3."
  type        = number
  default     = 3
}

variable "ebs_enabled" {
  description = "Indicates whether attach EBS volumes to the data nodes."
  type        = bool
  default     = false
}

variable "ebs_volume_size" {
  description = "The size of EBS volumes attached to data nodes (in GiB)."
  type        = number
  default     = 10
}

variable "ebs_volume_type" {
  description = "The type of EBS volumes attached to data nodes."
  type        = string
  default     = "gp3"
}

variable "ebs_throughput" {
  description = "The throughput (in MiB/s) of the EBS volumes attached to data nodes. Valid values are between 125 and 1000."
  type        = number
  default     = 125
}

variable "ebs_iops" {
  description = "The baseline input/output (I/O) performance of EBS volumes attached to data nodes."
  type        = number
  default     = 3000
}

variable "encrypt_kms_key_id" {
  description = "The KMS key ID to encrypt the OpenSearch cluster with. If not specified, then it defaults to using the AWS OpenSearch Service KMS key."
  type        = string
  default     = ""
}

variable "saml_enabled" {
  description = "Indicates whether to configure SAML for the OpenSearch dashboard."
  type        = bool
  default     = true
}

variable "saml_subject_key" {
  description = "Element of the SAML assertion to use for username."
  type        = string
  default     = ""
}

variable "saml_roles_key" {
  description = "Element of the SAML assertion to use for backend roles."
  type        = string
  default     = ""
}

variable "saml_entity_id" {
  description = "The unique Entity ID of the application in SAML Identity Provider."
  type        = string
  default     = ""
}

variable "saml_metadata_content" {
  description = "The metadata of the SAML application in xml format."
  type        = string
  default     = ""
}

variable "saml_session_timeout" {
  description = "Duration of a session in minutes after a user logs in. Default is 60. Maximum value is 1,440."
  type        = number
  default     = 60
}

variable "saml_master_backend_role" {
  description = "This backend role receives full permissions to the cluster, equivalent to a new master role, but can only use those permissions within Dashboards."
  type        = string
  default     = null
}

variable "saml_master_user_name" {
  description = "This username receives full permissions to the cluster, equivalent to a new master user, but can only use those permissions within Dashboards."
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

variable "custom_endpoint" {
  description = "Fully qualified domain for your custom endpoint. If not specified, then it defaults to <cluster_name>.<cluster_domain>"
  type        = string
  default     = null
}

variable "custom_endpoint_certificate_arn" {
  description = "The ARN of the custom ACM certificate."
  type        = string
  default     = ""
}

variable "advanced_options" {
  description = "Key-value string pairs to specify advanced configuration options."
  type        = map(string)
  default     = {}
}

variable "advanced_security_options_enabled" {
  description = "Whether advanced security is enabled."
  type        = bool
  default     = true
}

variable "advanced_security_options_internal_user_database_enabled" {
  description = "Whether to enable or not internal Kibana user database for ELK OpenDistro security plugin"
  type        = bool
  default     = true
}

variable "access_policies" {
  description = "IAM policy document specifying the access policies for the domain."
  type        = string
  default     = null
}
