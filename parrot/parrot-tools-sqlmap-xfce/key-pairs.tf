resource "aws_key_pair" "parrot-tools-sqlmap-xfce" {
	key_name = "parrot-tools-sqlmap-xfce"
	public_key = "${file("./keys/parrot-tools-sqlmap-xfce.pub")}"
}