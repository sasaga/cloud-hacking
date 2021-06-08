provider "aws" {
	access_key  = "${var.access_key}"
	secret_key  = "${var.secret_key}"
	region      = "${var.region}"
}

resource "aws_instance" "mobsf" {
	ami   = "ami-05aa753c043f1dcd3"
	instance_type = "t2.micro"
	security_groups = ["${aws_security_group.mobsf.name}"]
	key_name = "${aws_key_pair.mobsf.key_name}"

	connection {
	  type        = "ssh"
	  user        = "ubuntu"
	  private_key = file("./keys/mobsf")
	  host        = self.public_ip
	}

	ebs_block_device {
	  device_name = "/dev/sda1"
	  volume_type = "gp2"
	  volume_size = 30
	}

	provisioner "remote-exec" {
		inline = [
		"sudo apt-get update",
		"sudo apt-get install docker.io -y",
		"sudo docker run -p 0.0.0.0:8000:8000  -ti --cap-add=NET_ADMIN opensecurity/mobile-security-framework-mobsf"
		]
	}

	 tags = {
	   Name = "mobsf"
	}

}
resource "aws_eip" "mobsf" {
	vpc      = true
	instance = aws_instance.mobsf.id
}