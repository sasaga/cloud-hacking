resource "aws_key_pair" "kali-base-xfc4" {
	key_name = "kali-base-xfc4"
	public_key = "${file("./keys/kali-base-xfc4.pub")}"
}