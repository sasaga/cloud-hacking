provider "aws" {
	access_key  = "${var.access_key}"
	secret_key  = "${var.secret_key}"
	region      = "${var.region}"
}

resource "aws_instance" "kali-full-xfce" {
	ami   = "ami-05aa753c043f1dcd3"
	instance_type = "t2.micro"
	security_groups = ["${aws_security_group.kali-full-xfce.name}"]
	key_name = "${aws_key_pair.kali-full-xfce.key_name}"

	connection {
	  type        = "ssh"
	  user        = "ubuntu"
	  private_key = file("./keys/kali-full-xfce")
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
		"sudo docker run -p 0.0.0.0:6080:6080  -ti --cap-add=NET_ADMIN sasaga/kali-full-xfce:1.0"
		]
	}

	 tags = {
	   Name = "kali-full-xfce"
	}

}
resource "aws_eip" "kali" {
	vpc      = true
	instance = aws_instance.kali-full-xfce.id
}