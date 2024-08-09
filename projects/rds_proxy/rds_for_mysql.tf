resource "aws_db_subnet_group" "default" {
  name       = "${var.author}-default"
  subnet_ids = module.network.subnet_ids["private"]
}

resource "aws_db_instance" "master" {
  identifier        = "${var.author}-master"
  engine            = "mysql"
  engine_version    = "8.0.37"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  apply_immediately = true

  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  backup_retention_period = 1
  username                = "root"
  password                = var.password
  skip_final_snapshot     = true

  lifecycle {
    ignore_changes = [
      password,
    ]
  }
}

resource "aws_db_instance" "replica" {
  replicate_source_db = aws_db_instance.master.identifier
  identifier          = "${var.author}-replica"
  instance_class      = "db.t3.micro"

  vpc_security_group_ids = [aws_security_group.rds.id]
  availability_zone      = aws_db_instance.master.availability_zone

  backup_retention_period = 0
  skip_final_snapshot     = true
}
