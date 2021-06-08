resource "aws_security_group" "mobsf" {
	name = "mobsf-group"
	description = "Default security group that allows inbound and outbound traffic from all instances in the VPC"

	ingress {
	  from_port = "0"
	  to_port = "0"
	  protocol  = "-1"
	  cidr_blocks = ["0.0.0.0/0"]
	  self = true
	}

	ingress {
	  from_port = 22
	  to_port = 22
	  protocol  = "tcp"
	  cidr_blocks = ["0.0.0.0/0"]
	}
  
	ingress {
	  from_port = 8000
	  to_port = 8000
	  protocol  = "tcp"
	  cidr_blocks = ["0.0.0.0/0"]
	}
	egress {
	  from_port = "0"
	  to_port = "0"
	  protocol  = "-1"
	  cidr_blocks = ["0.0.0.0/0"]
	  self = true
	}

	egress {
	  from_port = 22
	  to_port = 22
	  protocol  = "tcp"
	  cidr_blocks = ["0.0.0.0/0"]
	}
  
	egress {
	  from_port = 8000
	  to_port = 8000
	  protocol  = "tcp"
	  cidr_blocks = ["0.0.0.0/0"]
	}
}