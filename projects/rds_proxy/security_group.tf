resource "aws_security_group" "rds" {
  name   = "${var.author}-rds"
  vpc_id = module.network.vpc_id

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }
}
