resource "aws_security_group" "kali-top10-xfc4" {
	name = "kali-top10-xfc4-group"
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
	  from_port = 6680
	  to_port = 6680
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
	  from_port = 6680
	  to_port = 6680
	  protocol  = "tcp"
	  cidr_blocks = ["0.0.0.0/0"]
	}
}