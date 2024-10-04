data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = var.ami_owners

  filter {
    name   = "name"
    values = ["${var.ami_name}"]
  }

  tags = {
    deploy_to_all_environments = "True"
  }
}

data "template_file" "user_data" {
  template = file("${path.module}/user_data/user_data.sh")

  vars = {
    project_name = var.ami_name
    rolename     = var.assume_role
  }
}

resource "aws_instance" "bastion" {
  ami                                  = data.aws_ami.ubuntu.id
  instance_type                        = "t3a.small"
  count                                = var.number_of_bastions
  user_data                            = data.template_file.user_data.rendered
  vpc_security_group_ids               = setunion(var.security_group_ids, [aws_security_group.bastion.id])
  subnet_id                            = var.subnets[0]
  monitoring                           = true
  associate_public_ip_address          = var.associate_public_ip_address
  iam_instance_profile                 = aws_iam_instance_profile.this.id
  instance_initiated_shutdown_behavior = "terminate"
  tags                                 = var.tags

  lifecycle {
    create_before_destroy = true
  }
}
