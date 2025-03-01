data "aws_security_group" "existing_sg" {
    id = "sg-000de32ed8df5bbca"
}

#terraform import aws_route53_record.example Z09576191Z5VQH6BJ1P7O_mysql.jobsearchindia.online


resource "aws_instance" "demo" {
    for_each = var.instances # Terraform will give us a variable called "each" in for_each loop
    ami             = "ami-09c813fb71547fc4f"
    instance_type   = each.value
    vpc_security_group_ids = [data.aws_security_group.existing_sg.id]
    tags = {
        Name = each.key
    }
}

/* output "ec2_info" {
  value       = aws_instance.demo
}
 */
