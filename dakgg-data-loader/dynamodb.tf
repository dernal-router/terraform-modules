resource "aws_dynamodb_table" "ddbtable" {
  name           = "dernal-router-data"
  hash_key       = "CHAR_NM"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  attribute {
    name = "CHAR_NM"
    type = "S"
  }
}
