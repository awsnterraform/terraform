variable "users_ec2" {
	description = "Create IAM users with only Read Only access to Ec2"
	type = "list"
	default = ["dhiman.ec2", "vikash.ec2", "terraform.ec2"]
}

variable "users_s3" {
	description = "Create IAM users with Only S3 Full Access"
	type = "string"
	default = "vikash.s3"
}
