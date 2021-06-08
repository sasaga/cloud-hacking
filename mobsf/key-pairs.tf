resource "aws_key_pair" "mobsf" {
	key_name = "mobsf"
	public_key = "${file("./keys/mobsf.pub")}"
}