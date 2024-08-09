resource "aws_db_proxy" "default" {
  name                   = "${var.author}-proxy"
  engine_family          = "MYSQL"
  role_arn               = aws_iam_role.rdsproxy.arn
  vpc_security_group_ids = [aws_security_group.rds.id]
  vpc_subnet_ids         = module.network.subnet_ids["public"]

  auth {
    auth_scheme = "SECRETS"
    secret_arn  = aws_secretsmanager_secret.default.arn
    iam_auth    = "DISABLED"
  }
}

resource "aws_db_proxy_default_target_group" "default" {
  db_proxy_name = aws_db_proxy.default.name
}

resource "aws_db_proxy_target" "default" {
  db_instance_identifier = aws_db_instance.replica.identifier
  db_proxy_name          = aws_db_proxy.default.name
  target_group_name      = aws_db_proxy_default_target_group.default.name
}
