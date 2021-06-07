resource "aws_key_pair" "kali-full-xfce" {
	key_name = "kali-full-xfce"
	public_key = "${file("./keys/kali-full-xfce.pub")}"
}