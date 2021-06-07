output  "kali" {
	value = "${aws_instance.kali-full-xfce.public_ip}"
}