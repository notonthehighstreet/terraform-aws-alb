### ALB
resource "aws_lb" "main" {
  name            = var.name
  idle_timeout    = var.idle_timeout
  subnets         = flatten(var.public_subnet_ids)
  security_groups = flatten(var.security_group_ids)

  tags = var.tags
}

resource "aws_lb_target_group" "main" {
  name                 = var.name
  port                 = var.lb_app_port
  protocol             = "HTTP"
  vpc_id               = var.vpc_id
  target_type          = var.target_type
  deregistration_delay = var.main_dereg_delay

  stickiness {
    type            = "lb_cookie"
    cookie_duration = var.cookie_duration
    enabled         = var.enable_stickiness
  }

  health_check {
    interval            = var.main_interval_health
    path                = var.main_path_health
    port                = var.main_port_health
    protocol            = var.main_protocol_health
    timeout             = var.main_timeout_health
    healthy_threshold   = var.main_threshold_health
    unhealthy_threshold = var.main_unhealthy_health
    matcher             = var.main_matcher
  }

  tags = var.tags
}

resource "aws_lb_target_group" "jnlp" {
  count                = var.enable_jnlp_listener ? 1 : 0
  name                 = "${var.name}-jnlp"
  port                 = var.jnlp_listener_port
  protocol             = "HTTP"
  vpc_id               = var.vpc_id
  target_type          = var.target_type
  deregistration_delay = var.jnlp_dereg_delay

  health_check {
    interval            = var.jnlp_interval_health
    path                = var.jnlp_path_health
    port                = var.jnlp_port_health
    protocol            = var.jnlp_protocol_health
    timeout             = var.jnlp_timeout_health
    healthy_threshold   = var.jnlp_threshold_health
    unhealthy_threshold = var.jnlp_unhealthy_health
    matcher             = var.jnlp_matcher
  }

  tags = var.tags
}

resource "aws_lb_listener" "https" {
  count             = var.enable_https_listener ? 1 : 0
  load_balancer_arn = aws_lb.main.id
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.acm_cert_arn[0]

  default_action {
    target_group_arn = aws_lb_target_group.main.id
    type             = "forward"
  }
}

resource "aws_lb_listener" "http" {
  count             = var.enable_http_listener ? 1 : 0
  load_balancer_arn = aws_lb.main.id
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.main.id
    type             = "forward"
  }
}

resource "aws_lb_listener" "jnlp" {
  count             = var.enable_jnlp_listener ? 1 : 0
  load_balancer_arn = aws_lb.main.id
  port              = var.jnlp_listener_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.jnlp[0].id
    type             = "forward"
  }
}

