# Create a security group with name terraform-ec2
resource "aws_security_group" "terraform-ec2" {
        name = "terraform-ec2"

# Allow incoming connection on port 80 for web server
        ingress {
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }
# Allow SSH access on port 22 for specific IP addresses
        ingress {
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = ["71.xx.xxx.xx/32","14.xx.xxx.1/32"]
	}
# Allow outbound traffic to all else you will not able to access internet on machine.
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
