resource "aws_instance" "inspec_test" {
  key_name                    = "${var.keypair}"
  ami                         = "ami-7c803d1c"
  instance_type               = "t2.micro"
  count                       = 1

  root_block_device {
    delete_on_termination = "true"
    volume_size           = "20"
  }

  tags {
    Name = "inspec_test"
  }
}

resource "aws_security_group" "inspec_test" {
  name   = "inspec_test"
}

resource "aws_security_group_rule" "ingress_ssh_workstation" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["${var.wkstn_cidr}"]
  security_group_id = "${aws_security_group.inspec_test.id}"
}

output "inspec_test" {
  value = "${aws_instance.inspec_test.public_dns}"
}
