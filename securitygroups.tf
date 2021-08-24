resource "aws_security_group" "hiro-Common" {
  name = "hiro-Common"
  tags {
        Name = "hiro-Common"
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

resource "aws_security_group" "hiro-IAM" {
  name = "hiro-IAM"
  tags {
        Name = "hiro-IAM"
  }
  description = "IAM SERVER INBOUD"
  vpc_id = "${aws_vpc.terraformmain.id}"


  ingress {
        from_port = "80"
        to_port = "80"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    from_port   = "9443"
    to_port     = "9443"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "hiro-GRAPH" {
  name = "hiro-GRAPH"
  tags {
        Name = "hiro-GRAPH"
  }
  description = "GRAPH SERVER INBOUD"
  vpc_id = "${aws_vpc.terraformmain.id}"


  ingress {
        from_port = "8443"
        to_port = "8443"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "Apptinuum" {
  name = "Apptinuum"
  tags {
        Name = "Apptinuum"
  }
  description = "Apptinuum SERVER INBOUD"
  vpc_id = "${aws_vpc.terraformmain.id}"


  ingress {
        from_port = "80"
        to_port = "80"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    from_port   = "9443"
    to_port     = "9443"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "Ema" {
  name = "Ema"
  tags {
        Name = "Ema"
  }
  description = "EMA SERVER INBOUD"
  vpc_id = "${aws_vpc.terraformmain.id}"


  ingress {
        from_port = "8084"
        to_port = "8084"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "8083"
    to_port     = "8083"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "8000"
    to_port     = "8000"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "8089"
    to_port     = "8089"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "8085"
    to_port     = "8085"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "445"
    to_port     = "445"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = "8081"
    to_port     = "8081"
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "Data" {
  name = "Data"
  tags {
        Name = "Data"
  }
  description = "Data SERVER INBOUD"
  vpc_id = "${aws_vpc.terraformmain.id}"


  ingress {
        from_port = "27017"
        to_port = "27017"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "Logstash" {
  name = "Logstash"
  tags {
        Name = "Logstash"
  }
  description = "Logstash SERVER INBOUD"
  vpc_id = "${aws_vpc.terraformmain.id}"


  ingress {
        from_port = "7076"
        to_port = "7076"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
        from_port = "8083"
        to_port = "8083"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
        from_port = "8082"
        to_port = "8082"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
        from_port = "8081"
        to_port = "8081"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "Elastic" {
  name = "Elastic"
  tags {
        Name = "Elastic"
  }
  description = "Elastic SERVER INBOUD"
  vpc_id = "${aws_vpc.terraformmain.id}"


  ingress {
        from_port = "80"
        to_port = "80"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
        from_port = "443"
        to_port = "443"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
        from_port = "2281"
        to_port = "2281"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "kibana" {
  name = "kibana"
  tags {
        Name = "kibana"
  }
  description = "kibana SERVER INBOUD"
  vpc_id = "${aws_vpc.terraformmain.id}"


  ingress {
        from_port = "80"
        to_port = "80"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
        from_port = "443"
        to_port = "443"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
        from_port = "2281"
        to_port = "2281"
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]

  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
