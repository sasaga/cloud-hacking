resource "aws_key_pair" "kali-top10-xfc4" {
	key_name = "kali-top10-xfc4"
	public_key = "${file("./keys/kali-top10-xfc4.pub")}"
}