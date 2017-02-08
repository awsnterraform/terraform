resource "aws_security_group" "terraform-ec2" {
        name = "terraform-ec2"
        ingress {
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }
        ingress {
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = ["74.86.35.77/32","14.141.80.50/32"]
	}
    	egress {
        	from_port       = 0
        	to_port         = 0
        	protocol        = "-1"
        	cidr_blocks     = ["0.0.0.0/0"]
	}
        tags {
                "Name" = "tarraform-ec2"
        }
}
