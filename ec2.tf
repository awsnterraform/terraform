resource "aws_instance" "terraform-ec2" {
        ami = "ami-f558a3e3"
	instance_type = "t2.micro"
	key_name = "terraform"
	vpc_security_group_ids = ["${aws_security_group.terraform-ec2.id}"]
	tags {
        "Name" = "1-terraform-ec2"
	}
}
