resource "aws_instance" "iam" {
  ami           = "${lookup(var.centos6, var.region)}"
  instance_type = "m4.xlarge"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.PublicAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.test1-Common.id}"]
  vpc_security_group_ids = ["${aws_security_group.test1-IAM.id}"]
  key_name = "${var.company_name}"
  user_data = "${var.long_key}"
  tags {
        Name = "${var.company_name}-iam"
  }
  root_block_device {
        volume_size = 100
    }
  
}
resource "aws_eip" "eip_test1_iam" {
         instance = "${aws_instance.iam.id}"
         vpc = true
         associate_with_private_ip = "${aws_instance.iam.private_ip}"
         depends_on = ["aws_internet_gateway.gw"]
    }



