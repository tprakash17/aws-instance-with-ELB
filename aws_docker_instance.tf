# using default VPC and subnets

resource "aws_default_vpc" "default" {
    tags {
        Name = "Default VPC"
    }
}

# making use of defualt subnet
resource "aws_default_subnet" "us-east-1a" {
  availability_zone = "us-east-1a"

    tags {
        Name = "Default subnet for us-east-1a"
    }
}

# updating default security group
resource "aws_default_security_group" "default" {
  vpc_id      = "${aws_default_vpc.default.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    self	= "true"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


# launch instance in default VPC
resource "aws_instance" "bonial" {

  count 	= 1
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  user_data 	= "${file("userdata.tpl")}"
 
  associate_public_ip_address 	= "true"
  key_name 			= "${var.ssh_key_pair}"
  subnet_id                   	= "${aws_default_subnet.us-east-1a.id}"
  vpc_security_group_ids      	= ["${aws_default_security_group.default.id}"]

  tags {
        Name 			= "Bonial - docker nginx instance"
       }

}
