# This is to get the information of public Ip of ec2 machine whichterraform create.
output "public_ip" {
      value = "${aws_instance.terraform-ec2.public_ip}"
}
# This is to get the information of private Ip of ec2 machine whichterraform create.
output "private_ip" {
      value = "${aws_instance.terraform-ec2.private_ip}"
}
