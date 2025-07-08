variable "ami_id" {
  default = ""
  description = "This is ami id"
  type = string
}

variable "instance_type" {
  default = ""
  description = "This is instance type declaration"
  type = string
}

variable "bucketName" {
  default = ""
  description = "This is aws s3 bucket name"
  type = string
}