moved {
  from = aws_kms_key.opensearch_encryption_key
  to   = aws_kms_key.this
}
