terraform {
  required_version = ">= 0.13"
  required_providers {
    elasticsearch = {
      source  = "phillbaker/elasticsearch"
      version = ">= 2.0.0"
    }
  }
}
