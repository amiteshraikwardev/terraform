resource "aws_instance" "iam" {
  ami           = "${lookup(var.centos6, var.region)}"
  instance_type = "m4.xlarge"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.PublicAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.hiro-Common.id}"]
  vpc_security_group_ids = ["${aws_security_group.hiro-IAM.id}"]
  key_name = "${var.company_name}"
  user_data = "${var.long_key}"
  tags {
        Name = "${var.company_name}-iam"
  }
  root_block_device {
        volume_size = 100
    }
  
}
resource "aws_eip" "eip_hiro_iam" {
         instance = "${aws_instance.iam.id}"
         vpc = true
         associate_with_private_ip = "${aws_instance.iam.private_ip}"
         depends_on = ["aws_internet_gateway.gw"]
    }
resource "aws_instance" "graph" {
  ami           = "${lookup(var.centos6, var.region)}"
  instance_type = "m4.xlarge"
  associate_public_ip_address = "false"
  subnet_id = "${aws_subnet.PublicAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.hiro-Common.id}"]
  vpc_security_group_ids = ["${aws_security_group.hiro-GRAPH.id}"]
  key_name = "${var.company_name}"
  user_data = "${var.long_key}"
  tags {
        Name = "${var.company_name}-graph"
  }
  root_block_device {
        volume_size = 100
    }
  
}
resource "aws_eip" "eip_hiro_graph" {
         instance = "${aws_instance.graph.id}"
         vpc = true
         associate_with_private_ip = "${aws_instance.graph.private_ip}"
         depends_on = ["aws_internet_gateway.gw"]
    }	

resource "aws_instance" "engine" {
  ami           = "${lookup(var.centos6, var.region)}"
  instance_type = "m4.xlarge"
  associate_public_ip_address = "false"
  subnet_id = "${aws_subnet.PublicAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.hiro-Common.id}"]
  key_name = "${var.company_name}"
  user_data = "${var.long_key}"
  tags {
        Name = "${var.company_name}-engine"
  }
  root_block_device {
        volume_size = 100
    }
}
resource "aws_eip" "eip_hiro_engine" {
       instance = "${aws_instance.engine.id}"
       vpc = true
       associate_with_private_ip = "${aws_instance.engine.private_ip}"
       depends_on = ["aws_internet_gateway.gw"]
    }


resource "aws_instance" "Apptinuum" {
  ami           = "${lookup(var.centos7, var.region)}"
  instance_type = "m4.xlarge"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.PublicAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.hiro-Common.id}"]
  vpc_security_group_ids = ["${aws_security_group.Apptinuum.id}"]
  key_name = "${var.company_name}"
  user_data = "${var.long_key}"
  tags {
        Name = "${var.company_name}-apptinuum"
  }
  root_block_device {
        volume_size = 100
    }
  
}

resource "aws_eip" "eip_Apptinuum" {
         instance = "${aws_instance.Apptinuum.id}"
         vpc = true
         associate_with_private_ip = "${aws_instance.Apptinuum.private_ip}"
         depends_on = ["aws_internet_gateway.gw"]
    }
	
resource "aws_instance" "data" {
  ami           = "${lookup(var.centos7, var.region)}"
  instance_type = "m4.xlarge"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.PrivateAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.hiro-Common.id}"]
  vpc_security_group_ids = ["${aws_security_group.Data.id}"]
  key_name = "${var.company_name}"
  user_data = "${var.long_key}"
  tags {
        Name = "${var.company_name}-data"
  }
  root_block_device {
        volume_size = 100
    }
  
}

resource "aws_eip" "eip_data" {
         instance = "${aws_instance.data.id}"
         vpc = true
         associate_with_private_ip = "${aws_instance.data.private_ip}"
         depends_on = ["aws_internet_gateway.gw"]
}

resource "aws_instance" "logstash" {
  ami           = "${lookup(var.centos7, var.region)}"
  instance_type = "m4.xlarge"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.PublicAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.hiro-Common.id}"]
  vpc_security_group_ids = ["${aws_security_group.Logstash.id}"]
  key_name = "${var.company_name}"
  user_data = "${var.long_key}"
  tags {
        Name = "${var.company_name}-logstash"
  }
  root_block_device {
        volume_size = 100
    } 
}

resource "aws_eip" "eip_logstash" {
         instance = "${aws_instance.logstash.id}"
         vpc = true
         associate_with_private_ip = "${aws_instance.logstash.private_ip}"
         depends_on = ["aws_internet_gateway.gw"]
    }
	
resource "aws_instance" "kibana" {
  ami           = "${lookup(var.centos7, var.region)}"
  instance_type = "m4.xlarge"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.PublicAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.hiro-Common.id}"]
  vpc_security_group_ids = ["${aws_security_group.kibana.id}"]
  key_name = "${var.company_name}"
  user_data = "${var.long_key}"
  tags {
        Name = "${var.company_name}-kibana"
  }
  root_block_device {
        volume_size = 100
    }
  
}
resource "aws_eip" "eip_kibana" {
         instance = "${aws_instance.kibana.id}"
         vpc = true
         associate_with_private_ip = "${aws_instance.kibana.private_ip}"
         depends_on = ["aws_internet_gateway.gw"]
    }

resource "aws_instance" "Elastic" {
  ami           = "${lookup(var.centos7, var.region)}"
  instance_type = "m4.xlarge"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.PrivateAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.hiro-Common.id}"]
  vpc_security_group_ids = ["${aws_security_group.Elastic.id}"]
  key_name = "${var.company_name}"
  user_data = "${var.long_key}"
  tags {
        Name = "${var.company_name}-elastic"
  }
  root_block_device {
        volume_size = 100
    }
  
}
resource "aws_eip" "eip_elastic" {
         instance = "${aws_instance.Elastic.id}"
         vpc = true
         associate_with_private_ip = "${aws_instance.Elastic.private_ip}"
         depends_on = ["aws_internet_gateway.gw"]
}


resource "aws_instance" "Ema" {
  ami           = "${lookup(var.windows12, var.region)}"
  instance_type = "m4.xlarge"
  associate_public_ip_address = "true"
  subnet_id = "${aws_subnet.PublicAZA.id}"
  vpc_security_group_ids = ["${aws_security_group.hiro-Common.id}"]
  vpc_security_group_ids = ["${aws_security_group.Ema.id}"]
  key_name = "${var.company_name}"
  tags {
        Name = "${var.company_name}-ema"
  }
  root_block_device {
        volume_size = 100
    }  
}

resource "aws_eip" "eip_ema" {
         instance = "${aws_instance.Ema.id}"
         vpc = true
         associate_with_private_ip = "${aws_instance.Ema.private_ip}"
         depends_on = ["aws_internet_gateway.gw"]
    }




