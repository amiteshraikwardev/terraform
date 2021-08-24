resource "aws_security_group" "test1-Common" {
  name = "test1-Common"
  tags {
        Name = "test1-Common"
  }
  description = "COMMON CONNECTION INBOUD"
  vpc_id = "${aws_vpc.terraformmain.id}"
  ingress {
        from_port = "3389"
        to_port = "3389"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

  }

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
    from_port   = "-1"
    to_port     = "-1"
    protocol    = "icmp"
    cidr_blocks = ["${var.vpc-fullcidr}"]
  }
  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    self        = true
    cidr_blocks = ["${var.vpc-fullcidr}"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


