resource "aws_instance" "bashtest" {
  key_name                    = "${var.keypair}"
  ami                         = "ami-7c803d1c"
  instance_type               = "t2.micro"
  count                       = 1

  root_block_device {
    delete_on_termination = "true"
    volume_size           = "20"
  }

  tags {
    Name = "bash test"
  }
}

resource "aws_security_group" "bashtest" {
  name   = "bashtest"
}

resource "aws_security_group_rule" "ingress_ssh_workstation" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${var.wkstn_cidr}"]
  security_group_id = "${aws_security_group.bashtest.id}"
}

output "bashtest" {
  value = "${aws_instance.bashtest.public_dns}"
}
