resource "aws_instance" "main" {
    for_each = var.instance_names
    ami = "ami-09c813fb71547fc4f"
    instance_type = each.value
    vpc_security_group_ids = [aws_security_group.allow_tls.id]

    tags = {
        Name = each.key
        Terraform = true
    }
}

resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
    description= " Allowing all the incoming and outgoing traffic on the instance"

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"] 
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }


    tags = {
        Name = " Terraform"
        Terraform = true 
    }
}

# output "ec2_info" {
#   value       = aws_instance.main
# }