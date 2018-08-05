# Create a new load balancer
resource "aws_elb" "bonial" {
  depends_on 	     = ["aws_instance.bonial"]
  name               = "bonial-terraform-elb"
  subnets 	     = ["${aws_default_subnet.us-east-1a.id}"]
  security_groups    = ["${aws_default_security_group.default.id}"] 
  listener {
    instance_port     = 8080
    instance_protocol = "tcp"
    lb_port           = 80
    lb_protocol       = "tcp"
  }

# This can be used if we are planning to have https on domain.
#  listener {
#    instance_port      = 8080
#    instance_protocol  = "http"
#    lb_port            = 443
#    lb_protocol        = "https"
#    ssl_certificate_id = "arn:aws:iam::<ACCT-ID>:server-certificate/crtName"
#  }


  instances                   = ["${aws_instance.bonial.id}"]
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "bonial-terraform-elb"
  }
}
