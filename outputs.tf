output "alb_name" {
  description = "The ARN suffix of the ALB"
  value       = aws_lb.main.name
}

output "alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.main.arn
}

output "alb_arn_suffix" {
  description = "The ARN suffix of the ALB"
  value       = aws_lb.main.arn_suffix
}

output "alb_dns_name" {
  description = "DNS name of ALB"
  value       = aws_lb.main.dns_name
}

output "alb_zone_id" {
  description = "The ID of the zone which ALB is provisioned"
  value       = aws_lb.main.zone_id
}

output "main_target_group_arn" {
  description = "The default target group ARN"

  value = [
    join("", aws_lb_target_group.main.*.arn),
  ]
}

output "jnlp_target_group_arn" {
  description = "The jnlp target group ARN"

  value = [
    join("", aws_lb_target_group.jnlp.*.arn),
  ]
}

output "all_target_group_arn" {
  description = "The jnlp target group ARN"

  value = [
    join(
      "",
      concat(
        aws_lb_target_group.jnlp.*.arn,
        aws_lb_target_group.main.*.arn,
      ),
    ),
  ]
}

output "http_listener_arn" {
  description = "The ARN of the HTTP listener"
  value       = join("", aws_lb_listener.http.*.arn)
}

output "https_listener_arn" {
  description = "The ARN of the HTTPS listener"
  value       = join("", aws_lb_listener.https.*.arn)
}

output "listener_arns" {
  description = "A list of all the listener ARNs"
  value = compact(
    concat(aws_lb_listener.http.*.arn, aws_lb_listener.https.*.arn),
  )
}

