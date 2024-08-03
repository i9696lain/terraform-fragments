resource "aws_alb" "alb" {
  name            = "${var.author}-alb"
  subnets         = module.network.subnet_ids["public"]
  security_groups = [aws_security_group.alb.id]
  internal        = false
}

resource "aws_alb_listener" "default" {
  load_balancer_arn = aws_alb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }
}
