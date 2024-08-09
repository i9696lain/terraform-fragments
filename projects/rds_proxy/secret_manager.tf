resource "aws_secretsmanager_secret" "default" {
  name       = "${var.author}-rds"
}

resource "aws_secretsmanager_secret_version" "default" {
  secret_id = aws_secretsmanager_secret.default.id
  secret_string = jsonencode({
    username = "root"
    password = var.password
  })

  lifecycle {
    ignore_changes = [
      secret_string,
    ]
  }
}
