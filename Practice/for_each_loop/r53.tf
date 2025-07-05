resource "aws_route53_record" "expense" {
    for_each = aws_instance.main
    zone_id = "Z07583031PEET0FZTRC5C"
    name = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
    type = "A"
    ttl = 1
    records = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
    allow_overwrite = true
}