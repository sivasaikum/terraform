 resource "aws_route53_record" "example" {
  for_each = aws_instance.demo
  zone_id = var.zone_id    # Replace with your actual Route 53 Hosted Zone ID
  name    = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"   # Fully qualified domain name
  type    = "A"               # Record type (e.g., A, CNAME, etc.)
  ttl     = 1               # Time to live in seconds
  records = each.key == "frontend" ?  [each.value.public_ip] : [each.value.private_ip]  # New value (IP address or another updated value)
  allow_overwrite = true
}