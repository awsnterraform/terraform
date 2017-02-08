output "public_ip" {
      value = "${aws_instance.terraform-ec2.public_ip}"
}

output "private_ip" {
      value = "${aws_instance.terraform-ec2.private_ip}"
}
