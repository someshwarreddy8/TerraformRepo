resource "aws_dynamodb_table" "terraform-lock-table" {
  name = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
   hash_key = "lockId"

   attribute {
     name = "lockId"
     type = "S"
   }
} 