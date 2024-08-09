data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["rds.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "rdsproxy" {
  name               = "${var.author}-rdsproxy"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy_attachment" "SecretsManagerReadWrite" {
  role       = aws_iam_role.rdsproxy.id
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}
