provider "aws" {
	access_key  = "${var.access_key}"
	secret_key  = "${var.secret_key}"
	region      = "${var.region}"
}

resource "aws_instance" "parrot-tools-sqlmap-xfce" {
	ami   = "ami-05aa753c043f1dcd3"
	instance_type = "t2.micro"
	security_groups = ["${aws_security_group.parrot-tools-sqlmap-xfce.name}"]
	key_name = "${aws_key_pair.parrot-tools-sqlmap-xfce.key_name}"

	connection {
	  type        = "ssh"
	  user        = "ubuntu"
	  private_key = file("./keys/parrot-tools-sqlmap-xfce")
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
		"sudo docker run -p 0.0.0.0:6080:6080  -ti --cap-add=NET_ADMIN sasaga/parrot-tools-sqlmap-xfce:1.0"
		]
	}

	 tags = {
	   Name = "parrot-tools-sqlmap-xfce"
	}

}
resource "aws_eip" "parrot" {
	vpc      = true
	instance = aws_instance.parrot-tools-sqlmap-xfce.id
}