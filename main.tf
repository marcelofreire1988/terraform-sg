data "aws_vpc" "default" {
 default = true
}

resource "aws_security_group" "linux-tips-conf" {
  name        = "linux-tips-conf"
  description = "Enable some and other ports to access"
  vpc_id      = data.aws_vpc.default.id


  dynamic "ingress" {
    iterator = ports
    for_each = var.ingress-ports
    content {
      from_port = ports.value
      protocol  = "tcp"
      to_port   = ports.value
      cidr_blocks = [
      "0.0.0.0/0"]
    }
  }

  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = [
    "0.0.0.0/0"]
  }
  tags = {
    Name = "Egress"
  }
}
