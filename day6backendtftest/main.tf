resource "aws_instance" "backendtestec2" {
    ami = var.ec2_ami
    instance_type = var.ec2_aws_instance_type
  
}