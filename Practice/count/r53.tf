resource "aws_route53_record" "private" {
    count = 3
    zone_id = "Z07583031PEET0FZTRC5C"
    name    = "${var.names[count.index]}.${var.domain_name}"
    type    = "A"
    ttl     = 1
    records = [aws_instance.expense[count.index].private_ip]
    allow_overwrite = true
}


resource "aws_route53_record" "public" {
    zone_id = "Z07583031PEET0FZTRC5C"
    name = var.domain_name
    type = "A"
    ttl = 1
    records = [aws_instance.expense[2].public_ip]
    allow_overwrite = true
}