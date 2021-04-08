variable "lb_app_port" {
}

variable "name" {
}

variable "vpc_id" {
}

variable "acm_cert_arn" {
  type = list(any)
}

variable "enable_http_listener" {
  default = false
}

variable "enable_https_listener" {
  default = false
}

variable "idle_timeout" {
  default = "600"
}

variable "public_subnet_ids" {
}

variable "security_group_ids" {
}

variable "namespace" {
  type    = string
  default = "mgmt"
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "target_type" {
  default = "ip"
}

variable "enable_jnlp_listener" {
  default = false
}

variable "jnlp_listener_port" {
  default = ""
}

variable "enable_stickiness" {
  default = false
}

variable "cookie_duration" {
  default = "86400"
}

variable "enable_main_health" {
  default = true
}

variable "main_interval_health" {
  default = "60"
}

variable "main_path_health" {
  default = "/"
}

variable "main_port_health" {
  default = "traffic-port"
}

variable "main_protocol_health" {
  default = "HTTP"
}

variable "main_timeout_health" {
  default = "10"
}

variable "main_threshold_health" {
  default = "2"
}

variable "main_unhealthy_health" {
  default = "5"
}

variable "main_matcher" {
  default = "200-299,403"
}

variable "enable_jnlp_health" {
  default = false
}

variable "jnlp_interval_health" {
  default = "60"
}

variable "jnlp_path_health" {
  default = "/"
}

variable "jnlp_port_health" {
  default = "traffic-port"
}

variable "jnlp_protocol_health" {
  default = "HTTP"
}

variable "jnlp_timeout_health" {
  default = "10"
}

variable "jnlp_threshold_health" {
  default = "2"
}

variable "jnlp_unhealthy_health" {
  default = "5"
}

variable "jnlp_matcher" {
  default = "200-299,403"
}

variable "main_dereg_delay" {
  default = "180"
}

variable "jnlp_dereg_delay" {
  default = "120"
}

