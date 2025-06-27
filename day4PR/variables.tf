variable "test_instance_ami" {
  description = "This is the AMI_ID of the instance"
  type        = string
  default     = ""
}

variable "test_instance_type" {
  description = "This is the type of instance"
  type        = string
  default     = ""

}

variable "test_instance_name" {
  description = "This is the tag name of the instance"
  type        = string
  default     = ""
}

variable "test_instance_az" {
  description = "This is the availability zone"
  type        = string
  default     = ""
}

variable "test_instance_backetname" {
  description = "This is the bucket name"
  type        = string
  default     = ""
}
