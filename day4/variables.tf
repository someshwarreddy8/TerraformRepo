variable "instance16_ami" {
  description = "This is ami id"
  type        = string
  default     = ""
}

variable "instance16_type" {
  description = "This is instance type"
  type = string
  default = ""
}

variable "instance16_zoneId" {
  description = "This is availability zone id"
  type = string
  default = ""
}

variable "instance16_Name" {
  description = "This is tag name"
  type = string
  default = ""
}

variable "bucketname" {
  description = "This is s3 bucket name"
  type = string
  default = ""
}