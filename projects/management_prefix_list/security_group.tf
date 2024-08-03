resource "aws_security_group" "alb" {
  name   = "${var.author}-alb"
  vpc_id = module.network.vpc_id

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = concat(
      var.sample_cidrs_A,
      var.sample_cidrs_B,
    )
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    prefix_list_ids = [
      aws_ec2_managed_prefix_list.sample_cidrs_A.id,
      aws_ec2_managed_prefix_list.sample_cidrs_B.id,
    ]
  }
}

resource "aws_ec2_managed_prefix_list" "sample_cidrs_A" {
  name           = "sample_cidrs_A"
  address_family = "IPv4"
  max_entries    = length(var.sample_cidrs_A)

  dynamic "entry" {
    for_each = var.sample_cidrs_A

    content {
      cidr = entry.value
    }
  }
}

resource "aws_ec2_managed_prefix_list" "sample_cidrs_B" {
  name           = "sample_cidrs_B"
  address_family = "IPv4"
  max_entries    = length(var.sample_cidrs_B)

  dynamic "entry" {
    for_each = var.sample_cidrs_B

    content {
      cidr = entry.value
    }
  }
}
